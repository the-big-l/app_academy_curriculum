require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class ModelBase
  def self.method_missing(method_name, *values)
    column_names = method_name.to_s[/^find_by_(.*)/, 1].split('_and_')

    # options = Hash[column_names.zip(values)]
    # self.where(options)
    objects = QuestionsDatabase.instance.execute(<<-SQL, *values)
      SELECT
        *
      FROM
        #{self.db}
      WHERE
        #{column_names.map { |col| "#{col} = ?"}.join(' AND ') }
      SQL
      objects.map { |object| self.new(object) }
  end

  def save
    if @id
      puts "Updating!"
      update
      return
    end

    cols = instance_variables.map { |ivar| ivar.to_s[1..-1] }.drop(1).join(', ')
    values = instance_variables.map { |ivar| instance_variable_get(ivar) }.drop(1)
    QuestionsDatabase.instance.execute(<<-SQL, *values)
      INSERT INTO
        #{self.class.db} (#{cols})
      VALUES
        (#{values.map {|ivar| '?'}.join(', ')})
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    cols = instance_variables.map { |ivar| ivar.to_s[1..-1] }.drop(1)
    values = instance_variables.map { |ivar| instance_variable_get(ivar) }.rotate
    raise "#{self} not in database" unless @id
    # @title, @body, @author_id, @id
    QuestionsDatabase.instance.execute(<<-SQL, *values)
      UPDATE
        questions
      SET
        #{cols.map { |column| "#{column} = ?" }.join(', ')}
      WHERE
        id = ?
    SQL

  end

  def self.where(options)
    filters = options.map { |k, v| "#{k.to_s} = '#{v.to_s}'" }.join(' and ') if options.is_a?(Hash)
    filters = options if options.is_a?(String)
    p filters
    object_ids = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        id
      FROM
        #{self.db}
      WHERE
        #{filters}
    SQL

    object_ids.map { |id_hash| self.find_by_id(id_hash['id']) }
  end

end

class Question < ModelBase
  attr_accessor :title, :body

  def self.db
    'questions'
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT * FROM questions WHERE author_id = ?
      SQL
    questions.map { |question| Question.new(question)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    Follow.followers_for_question_id(@id)
  end

  def likers
    Like.likers_for_question_id(@id)
  end

  def num_likes
    Like.num_likes_for_question_id(@id)
  end

  def most_liked(n)
    Like.most_liked_questions(n)
  end

end

class User < ModelBase
  attr_accessor :fname, :lname

  def self.db
    'users'
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT * FROM users WHERE fname = ? AND lname = ?
      SQL

      User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    Follow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    Like.liked_questions_for_user_id(@id)
  end

  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(ql.user_id) AS FLOAT) / CAST(COUNT(DISTINCT(q.id)) AS FLOAT) avg_karma
      FROM questions q
      LEFT JOIN question_likes ql ON ql.question_id = q.id
      WHERE q.author_id = ?
    SQL
    karma.first['avg_karma']
  end
  #
  # SELECT
  #   CAST(COUNT(DISTINCT(q.id)) AS FLOAT) / CAST(COUNT(ql.user_id) AS FLOAT) avg_karma
  # FROM questions q
  # LEFT JOIN question_likes ql ON ql.user_id = q.author_id
  # WHERE q.author_id = @id

end

class Follow < ModelBase
  def self.db
    'questions'
  end

  def self.followers_for_question_id(question_id)
    user_ids = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        user_id
      FROM
        question_follows
      WHERE
        question_id = ?
      SQL

    user_ids.map { |id| User.find_by_id(id['user_id']) }
  end

  def self.followed_questions_for_user_id(user_id)
    q_ids = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        question_id
      FROM
        question_follows
      WHERE
        user_id = ?
      SQL

    q_ids.map { |id| Question.find_by_id(id['question_id']) }
  end

  def self.most_followed_questions(n)
    q_ids = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        question_id
      FROM
        question_follows
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
      SQL
      q_ids.map { |id| Question.find_by_id(id['question_id']) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end


end

class Reply < ModelBase
  attr_accessor :body

  def self.db
    'replies'
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT * FROM replies WHERE user_id = ?
      SQL
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT * FROM replies WHERE question_id = ?
      SQL
    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    raise "This is the highest level parent" unless @parent_id
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT * FROM replies WHERE parent_id = ?
      SQL
    replies.map { |reply| Reply.new(reply) }
  end
end

class Like < ModelBase

  def self.db
    'questions'
  end

  def self.likers_for_question_id(question_id)
    user_ids = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        user_id
      FROM
        question_likes
      WHERE
        question_id = ?
      SQL

    user_ids.map { |id| User.find_by_id(id['user_id']) }
  end

  def self.num_likes_for_question_id(question_id)
    count = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) count
      FROM
        question_likes
      WHERE
        question_id = ?
      SQL

    count.first['count']
  end

  def self.liked_questions_for_user_id(user_id)
    question_ids = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        question_id
      FROM
        question_likes
      WHERE
        user_id = ?
      SQL

    question_ids.map { |id| Question.find_by_id(id['question_id']) }
  end

  def self.most_liked_questions(n)
    q_ids = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        question_id
      FROM
        question_likes
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
      SQL
      q_ids.map { |id| Question.find_by_id(id['question_id']) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

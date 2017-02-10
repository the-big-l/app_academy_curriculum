require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @column_syms if @column_syms

    column_strings = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      SQL

    @column_syms = column_strings.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column.to_s) do
        attributes[column]
      end

      define_method("#{column}=") do |value|
        attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    results  = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
      SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |options|
      self.new(options)
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
     SELECT *
     FROM #{table_name}
     WHERE id = ?
     SQL

   results.empty? ? nil : self.new(results.first)
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      raise_attr_error(attr_name.to_sym)

      send("#{attr_name}=", value)
    end

    self
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |col|
      send(col)
    end
  end

  def insert
    col_names = self.class.columns
    qmarks = ['?'] * col_names.size * ','

    sql_insert(col_names, qmarks)
    send(:id=, DBConnection.last_insert_row_id)

    self
  end

  def update
    col_names = self.class.columns.drop(1)
    set_string = col_names.map { |col| "#{col} = ?" }.join(', ')

    sql_update(set_string)

    self
  end

  def save
    id.nil? ? insert : update
  end

  private

  def sql_insert(col_names, qmarks)
    DBConnection.execute(<<-SQL, attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names.join(',')})
      VALUES
        (#{qmarks})
    SQL
  end

  def sql_update(set_string)
    DBConnection.execute(<<-SQL, *attribute_values.rotate)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_string}
      WHERE
        id = ?
    SQL
  end

  def raise_attr_error(attr_name)
    error = "unknown attribute '#{attr_name}'"
    raise error unless self.class.columns.include?(attr_name)
  end
end

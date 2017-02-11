require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    cols = params.keys
    where_line = cols.map { |col| "#{col} = ?" }.join(' AND ')

    results = search_db(where_line, params.values)

    parse_all(results)
  end

  private

  def search_db(where_line, values)
    DBConnection.execute(<<-SQL, *values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL
  end
end

class SQLObject
  extend Searchable
end

require_relative('../db/sql_runner')

class Publisher

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO publishers (name)
           VALUES ($1)
           RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE publishers
           SET (name) = ($1)
           WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM publishers
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end

require_relative('../db/sql_runner')

class Author

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    sql = "INSERT INTO authors (first_name, last_name)
           VALUES ($1, $2)
           RETURNING *"
    values = [@first_name, @last_name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE authors
           SET (first_name, last_name) = ($1, $2)
           WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM authors"
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM authors
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM authors"
    results = SqlRunner.run(sql)
    return self.map_items(results)
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM authors
           WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Author.new(result)
  end

  def self.map_items(authors)
    result = authors.map {|hash| Author.new(hash)}
    return result
  end

end

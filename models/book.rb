require_relative('../db/sql_runner')

class Book

  attr_accessor :year, :title, :author_id, :publisher_id, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @year = options['year']
    @author_id = options['author_id']
    @publisher_id = options['id']
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO books (title, year, author_id, publisher_id, genre)
           VALUES ($1, $2, $3, $4, $5)
           RETURNING *"
    values = [@title, @year, @author_id, @publisher_id, @genre]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE books
           SET (title, year, author_id, publisher_id, genre) =
               ($1, $2, $3, $4, $5)
           WHERE id = $6"
    values = [@title, @year, @author_id, @publisher_id, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM books
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



end

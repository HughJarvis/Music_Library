require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end


  #define method to list all artists
  def Artist.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map{ |artist| Artist.new(artist)}
  end

  #define method to return album(s) by a given artist
  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|album| Album.new(album)}
  end

  #define method to edit (i.e update) given artist
  def update()

  end

  #define class method to delete artist by id
  def Artist.delete(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #define class method to delete all artists
  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  #define class method to find an artist by their id
  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end
end

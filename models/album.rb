require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  #define method to save albums
  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
          VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end


  #define method to list all albums
  def Album.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map{ |album| Album.new(album)}
  end


  #define method to return artist for given album
  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end

  #define method to edit (i.e update) an album
  def update()
    sql = "UPDATE artists SET (title, genre, artist_id)
          VALUES ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  #define method to delete one album by its id
  def Album.delete(id)
    sql = "DELETE FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


  #define method to delete albums by a particular artist
  def Album.delete_by_artist(artist_id)
    sql = "DELETE FROM albums WHERE artist_id = $1"
    values = [artist_id]
    SqlRunner.run(sql, values)
  end


  #define class method to delete all albums
  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  #define class method to find an album by its id
  def Album.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Album.new(result)
  end

end

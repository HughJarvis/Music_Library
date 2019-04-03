require_relative('../db/sql_runner')

class Artist

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






end

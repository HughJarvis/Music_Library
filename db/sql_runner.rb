require('pg')

class SqlRunner

  def SqlRunner.run(sql, values = [])

      #connect to db
      db = PG.connect({host: 'localhost', dbname: 'music_library'})
      #prepares statemet
      db.prepare("query", sql)
      #executes statement
      result = db.exec_prepared("query", values)

      #closes database
      db.close()

      #return result
      return result
  end
end

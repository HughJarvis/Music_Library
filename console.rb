require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

artist1 = Artist.new({
  'name' => 'De La Soul'
  })

artist1.save()

artist2 = Artist.new({
  'name' => 'Daft Punk'
  })

artist2.save()

album1 = Album.new({
  'title' => 'Homework',
  'genre' => 'house',
  'artist_id' => "#{artist2.id}"
  })

album1.save()

album2 = Album.new({
  'title' => 'Three Feet High & Rising',
  'genre' => 'hip-hop',
  'artist_id' => "#{artist1.id}"
  })

album2.save()



binding.pry()

Artist.all()
Album.all()
nil

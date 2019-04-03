require('pry-byebug')
require_relative('models/artist.rb')

artist1 = Artist.new({
  'name' => 'Janelle Monae'
  })

artist1.save()

artist2 = Artist.new({
  'name' => 'Daft Punk'
  })

artist2.save



binding.pry()

Artist.all()
nil

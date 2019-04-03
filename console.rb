require('pry-byebug')
require_relative('models/artist.rb')

artist1 = Artist.new({
  'name' => 'Janelle Monae'
  })

artist1.save()





binding.pry()


nil

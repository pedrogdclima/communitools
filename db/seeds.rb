# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
  # ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #   MovieGenre.find_or_create_by!(name: genre_name)
  # end

User.create!(username: 'pedrolima', name: 'Pedro', email: 'pedro@server.com', password: 'password', latlng: '43.6652, -79.3284')

User.create!(username: 'maggieclark', name: 'Maggie', email: 'maggie@server.com', password: 'password', latlng: '43.6623, -79.3255')

User.create!(username: 'avethebabe', name: 'Avery', email: 'avery@server.com', password: 'password', latlng: '43.6947, -79.3976')

User.create!(username: 'nickchalis', name: 'Nick', email: 'nick@server.com', password: 'password', latlng: '43.6659, -79.3454')

[
  {name: 'Mallet', brand: '', desc:'', user_id: '3'},
  {name: 'Side Cutters', brand: 'Park Tool', desc:'', user_id: '1'},
  {name: '3D Printer', brand: 'Epson', desc:'', user_id: '2'},
  {name: 'Tile Cutter', brand: 'Master Craft', desc:'', user_id: '3'},
  {name: 'Oscillating Multitool', brand: 'Dewalt', desc:'', user_id: '1'},
  {name: 'Chain Breaker', brand: 'Shimano', desc:'', user_id: '1'},
  {name: 'Crank Puller', brand: 'Park Tool', desc:'', user_id: '1'},
  {name: 'Truing Stand', brand: 'Park Tool', desc:'', user_id: '4'},
  {name: 'Car Jack', brand: 'Mastercraft', desc:'', user_id: '4'},
  {name: 'Torque Wrench', brand: '', desc:'', user_id: '4'},
  {name: 'Air Compressor', brand: '', desc:'', user_id: '4'},
].each do |tool|
  Tool.create!(tool)
end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
  # ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #   MovieGenre.find_or_create_by!(name: genre_name)
  # end

User.create!(username: 'pedrolima', name: 'Pedro', email: 'pedro.lima@server.com', password: 'pedrolima')

User.create!(username: 'toriejw', name: 'Torie', email: 'victoriajw@server.com', password: 'toriejw')

User.create!(username: 'avethebabe', name: 'Avery', email: 'avedl@server.com', password: 'avethebabe')

[
  {name: 'Mallet', brand: '', desc:'', user_id: '3'},
  {name: 'Side Cutters', brand: 'Park Tool', desc:'', user_id: '1'},
  {name: '3D Printer', brand: 'Epson', desc:'', user_id: '2'},
  {name: 'Tile Cutter', brand: 'Master Craft', desc:'', user_id: '3'},
  {name: 'Oscillating Multitool', brand: 'Dewalt', desc:'', user_id: '1'},
  {name: 'Chain Breaker', brand: 'Shimano', desc:'', user_id: '1'},
  {name: 'Crank Puller', brand: 'Park Tool', desc:'', user_id: '1'},
].each do |tool|
  Tool.create!(tool)
end
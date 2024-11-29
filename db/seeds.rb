# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
Airport.destroy_all

airports = [
  { code: 'MOR', name: 'Mordor International' },
  { code: 'HBT', name: 'Hobbiton Regional Airport' },
  { code: 'RIV', name: 'Rivendell Elven Airways' },
  { code: 'GON', name: 'Gondor Central' },
  { code: 'ROH', name: 'Rohan Fields Airport' },
  { code: 'ISE', name: 'Isengard Fields Airport' },
  { code: 'MRK', name: 'Mirkwood Forest Landing' },
  { code: 'ERE', name: 'Erebor Mountain Airport' },
  { code: 'LHL', name: 'Lothlorien Haven' },
  { code: 'GSG', name: 'Grey Havens Seaport Airport' }
]

airports.each do |airport|
  Airport.create!(
    code: airport[:code],
    name: airport[:name]
  )
end

puts "Created #{Airport.count} airports"

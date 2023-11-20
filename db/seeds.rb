# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Doctor.destroy_all
puts "cleaning the database"
5.times do
  Doctor.create(first_name: Faker::GreekPhilosophers.name,
  last_name: Faker::Name.last_name,
  title: ["Prof", "Doctor"].sample,
  available: [true, false].sample,
  specialty: ["Dermatology", "Psychitry", "Surgery", "Neurology", "Pediatrics", "General Surgery"].sample,
  experience: Random.rand(1..30))
end

puts "creating new files"

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
puts "destroying record old doctors"
Doctor.destroy_all
puts "adding new doctors"
5.times do
  Doctor.create(first_name: Faker::GreekPhilosophers.name,
  last_name: Faker::Name.last_name,
  title: ["Prof.", "Dr."].sample,
  available: [true, false].sample,
  specialty: ["Dermatologist", "Pneumologist", "Cardiolgist", "Dentist", "GP"].sample,
  experience: Random.rand(2..6))

end

puts "destroying education record of old doctors"
Education.destroy_all
puts "creating education"
5.times do
  Education.create(university: Faker::University.name, degree_name: Faker::Educator.course, score: Random.rand(50..100), doctor: Doctor.all.sample)
end

puts "deleting records of old patients"
Patient.destroy_all
puts "adding patients"
5.times do
  Patient.create(first_name: Faker::GreekPhilosophers.name,
  last_name: Faker::Name.last_name,
  insurance: ["Private", "Public"].sample,
  cured: [true, false].sample)
end

puts "deleting records of old appointments"
Appointment.destroy_all
puts "adding appoinetments"
5.times do
  Appointment.create(cause: Faker::GreekPhilosophers.name,
  urgent: [true, false].sample,
  date: (Date.today + rand(1..365)).to_s,
  doctor: Doctor.all.sample,
  patient: Patient.all.sample)
end

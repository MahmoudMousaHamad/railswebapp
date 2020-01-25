# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !User.find_by(email: "admin@test.com")
    User.create!(email: "admin@test.com", password: "password", password_confirmation: "password", role: "superadmin", verified: true)
end

if !Discipline.find_by(name: "Art")
    art_discipline = Discipline.create! :name => "Art", :published => true 
    Subject.create! :name => "Islamic Art", :discipline_id => art_discipline.id, :published => true
end
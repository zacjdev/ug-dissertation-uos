# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

student_user = User.create!(email:'student@sheffield.ac.uk', name:'Test1', password:'Password1!', role:'student', password_confirmation:'Password1!')
lecturer_user = User.create!(email:'lecturer@sheffield.ac.uk', name:'Test 2', password:'Password1!', role:'lecturer', password_confirmation:'Password1!')
facilitator_user = User.create!(email:'facilitator@sheffield.ac.uk', name:'Test 3', password:'Password1!', role:'facilitator', password_confirmation:'Password1!')

Cmodule.destroy_all

cmodule = Cmodule.create!(name:'Test Module')
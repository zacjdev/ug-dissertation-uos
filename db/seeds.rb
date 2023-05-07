# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

student_user = User.create!(email:'student@sheffield.ac.uk', name:'John Smith', password:'Password1!', role:'student', password_confirmation:'Password1!')
lecturer_user = User.create!(email:'lecturer@sheffield.ac.uk', name:'Jamie Cook', password:'Password1!', role:'lecturer', password_confirmation:'Password1!')
facilitator_user = User.create!(email:'facilitator@sheffield.ac.uk', name:'Edward Clover', password:'Password1!', role:'facilitator', password_confirmation:'Password1!')
student_user2 = User.create!(email:'student2@sheffield.ac.uk', name:'Alfred Jacobs', password:'Password1!', role:'student', password_confirmation:'Password1!')
student_user3 = User.create!(email:'student3@sheffield.ac.uk', name:'James Smith', password:'Password1!', role:'student', password_confirmation:'Password1!')

Cmodule.destroy_all

cmodule = Cmodule.create!(name:'Test Module 1')
cmodule2 = Cmodule.create!(name:'Test Module 2')
team1 = Team.create!(name: cmodule.id)
team2 = Team.create!(name: cmodule.id)
team3 = Team.create!(name: cmodule.id)
team4 = Team.create!(name: cmodule2.id)

SurveyTemplate.destroy_all

survey1 = SurveyTemplate.create!(question1: 'Question 1', question2: 'Question 2', question3: 'Question 3', question4: 'Question 4', question5: 'Question 5')
survey2 = SurveyTemplate.create!(question1: 'Question 1', question2: 'Question 2', question3: 'Question 3', question4: 'Question 4', question5: 'Question 5')

SurveyResponse.destroy_all

link1 = UserTeamLinker.create!(user_id: student_user.id, team_id: team1.id)
link2 = UserTeamLinker.create!(user_id: student_user2.id, team_id: team1.id)
link3 = UserTeamLinker.create!(user_id: student_user3.id, team_id: team1.id)

Report.destroy_all
report1 = Report.create!(team_id: team1.id, content: 'This is a report', created_by_user_id: student_user.id)

SurveyResponse.create!(team_id: team1.id, user_id: student_user.id, created_by: student_user.id, question1response: '5', question2response: '5', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team1.id, user_id: student_user2.id, created_by: student_user.id, question1response: '2', question2response: '3', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team1.id, user_id: student_user3.id, created_by: student_user.id, question1response: '5', question2response: '5', question3response: '3', question4response: '4', question5response: '3')

SurveyResponse.create!(team_id: team1.id, user_id: student_user.id, created_by: student_user2.id, question1response: '3', question2response: '3', question3response: '3', question4response: '4', question5response: '2')
SurveyResponse.create!(team_id: team1.id, user_id: student_user2.id, created_by: student_user2.id, question1response: '2', question2response: '3', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team1.id, user_id: student_user3.id, created_by: student_user2.id, question1response: '5', question2response: '5', question3response: '4', question4response: '4', question5response: '1')

SurveyResponse.create!(team_id: team1.id, user_id: student_user.id, created_by: student_user3.id, question1response: '3', question2response: '3', question3response: '3', question4response: '4', question5response: '2')
SurveyResponse.create!(team_id: team1.id, user_id: student_user2.id, created_by: student_user3.id, question1response: '2', question2response: '3', question3response: '3', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team1.id, user_id: student_user3.id, created_by: student_user3.id, question1response: '3', question2response: '5', question3response: '3', question4response: '4', question5response: '2')

link4 = UserTeamLinker.create!(user_id: student_user.id, team_id: team2.id)
link5 = UserTeamLinker.create!(user_id: student_user2.id, team_id: team2.id)
link6 = UserTeamLinker.create!(user_id: student_user3.id, team_id: team2.id)

SurveyResponse.create!(team_id: team2.id, user_id: student_user.id, created_by: student_user.id, question1response: '1', question2response: '1', question3response: '1', question4response: '0', question5response: '0')
SurveyResponse.create!(team_id: team2.id, user_id: student_user2.id, created_by: student_user.id, question1response: '5', question2response: '5', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team2.id, user_id: student_user3.id, created_by: student_user.id, question1response: '5', question2response: '5', question3response: '4', question4response: '4', question5response: '5')

SurveyResponse.create!(team_id: team2.id, user_id: student_user.id, created_by: student_user2.id, question1response: '0', question2response: '2', question3response: '3', question4response: '1', question5response: '2')
SurveyResponse.create!(team_id: team2.id, user_id: student_user2.id, created_by: student_user2.id, question1response: '4', question2response: '3', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team2.id, user_id: student_user3.id, created_by: student_user2.id, question1response: '5', question2response: '5', question3response: '4', question4response: '4', question5response: '5')

SurveyResponse.create!(team_id: team2.id, user_id: student_user.id, created_by: student_user3.id, question1response: '1', question2response: '1', question3response: '0', question4response: '3', question5response: '2')
SurveyResponse.create!(team_id: team2.id, user_id: student_user2.id, created_by: student_user3.id, question1response: '5', question2response: '4', question3response: '4', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team2.id, user_id: student_user3.id, created_by: student_user3.id, question1response: '4', question2response: '5', question3response: '5', question4response: '4', question5response: '5')

link7 = UserTeamLinker.create!(user_id: student_user.id, team_id: team3.id)
link8 = UserTeamLinker.create!(user_id: student_user2.id, team_id: team3.id)
link9 = UserTeamLinker.create!(user_id: student_user3.id, team_id: team3.id)

SurveyResponse.create!(team_id: team3.id, user_id: student_user.id, created_by: student_user.id, question1response: '3', question2response: '4', question3response: '4', question4response: '2', question5response: '2')
SurveyResponse.create!(team_id: team3.id, user_id: student_user2.id, created_by: student_user.id, question1response: '5', question2response: '5', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team3.id, user_id: student_user3.id, created_by: student_user.id, question1response: '5', question2response: '5', question3response: '4', question4response: '4', question5response: '5')

SurveyResponse.create!(team_id: team3.id, user_id: student_user.id, created_by: student_user2.id, question1response: '3', question2response: '2', question3response: '3', question4response: '4', question5response: '2')
SurveyResponse.create!(team_id: team3.id, user_id: student_user2.id, created_by: student_user2.id, question1response: '4', question2response: '3', question3response: '5', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team3.id, user_id: student_user3.id, created_by: student_user2.id, question1response: '5', question2response: '5', question3response: '4', question4response: '4', question5response: '5')

SurveyResponse.create!(team_id: team3.id, user_id: student_user.id, created_by: student_user3.id, question1response: '3', question2response: '3', question3response: '2', question4response: '3', question5response: '2')
SurveyResponse.create!(team_id: team3.id, user_id: student_user2.id, created_by: student_user3.id, question1response: '5', question2response: '4', question3response: '4', question4response: '4', question5response: '5')
SurveyResponse.create!(team_id: team3.id, user_id: student_user3.id, created_by: student_user3.id, question1response: '4', question2response: '5', question3response: '5', question4response: '4', question5response: '5')

require 'rails_helper'

describe 'Feature tests' do

    let(:student)      { User.create(name: 'User One',   email: 'user1@sheffield.ac.uk', role: 'student', password: 'Password1!', password_confirmation: 'Password1') }
    let!(:lecturer)     { User.create(name: 'User Two',   email: 'user2@sheffied.ac.uk', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1') }
    let(:facilitator) { User.create(name: 'Admin user', email: 'user3@sheffield.ac.uk', role: 'facilitator',  password: 'Password1!', password_confirmation: 'Password1') }

    specify 'I cannot access the blog without logging in' do
        visit '/'
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    context 'As a logged in user student' do

        before do
            @cmodule = Cmodule.create!(name:'Test Module 1')
            @cmodule2 = Cmodule.create!(name:'Test Module 2')
            @team1 = Team.create!(name: cmodule.id)
            @team2 = Team.create!(name: cmodule.id)
            login_as student
        end

        specify "I cannot see the admin view" do
            visit "/dashboard"
            expect(page).not_to have_content 'Lecturer Dashboard Home'
        end

        specify "I am sent to the studet home" do
            visit "/"
            expect(page).to have_content 'My teams'
        end

        specify "I can view my team" do
            # visit team1.id
            visit "/teams/#{team1.id}"
            expect(page).to have_content 'Report Problem'
        end

        specify "I can view make a report" do
            visit "/teams/#{team1.id}"
            click_link 'Report Problem'
            expect(page).to have_content 'Report content'
        end



    end
end
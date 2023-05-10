RSpec.describe IndexController, type: :request do
    describe 'GET /' do
        context 'when user is a student' do
            it 'redirects to /home' do
                user = User.create!(email: 'user@sheffield.ac.uk', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
                sign_in user
                visit '/'
                expect(response).to redirect_to('/home')
            end
        end
        context 'when user is a lecturer' do
            it 'redirects to /dashboard' do
                user = User.create!(email: 'user@sheffield.ac.uk', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
                sign_in user
                visit '/'
                expect(response).to redirect_to('/dashboard')
            end
        end
        context 'when user is a facilitator' do
            it 'redirects to /dashboard' do
                user = User.create!(email: 'user@sheffield.ac.uk', role: 'facilitator', password: 'Password1!', password_confirmation: 'Password1!')
                sign_in user
                visit '/'
                expect(response).to redirect_to('/dashboard')
            end
        end
        context 'when user is not logged in' do
            it 'redirects to /users/sign_in' do
                visit '/'
                expect(response).to redirect_to('/users/sign_in')
            end
        end
    end
end
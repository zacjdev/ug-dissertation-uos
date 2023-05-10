RSpec.describe StudentsController, type: :controller do
    # show, home, takesurvey
    describe "GET #show" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :show, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #home" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :home, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #takesurvey" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :takesurvey, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end
end

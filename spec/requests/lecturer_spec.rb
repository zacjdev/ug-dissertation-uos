RSpec.describe LecturerController, type: :controller do
    # home modules surveys checklists users
    describe "GET #home" do
        it "returns http success" do
            # login
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # get home
            get :home
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #modules" do
        it "returns http success" do
            # login
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # get modules
            get :modules
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #surveys" do
        it "returns http success" do
            # login
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # get surveys
            get :surveys
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #checklists" do
        it "returns http success" do
            # login
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # get checklists
            get :checklists
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #users" do
        it "returns http success" do
            # login
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # get users
            get :users
            expect(response).to have_http_status(:success)
        end
    end
end
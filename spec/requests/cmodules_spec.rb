RSpec.describe CmodulesController, type: :controller do
    # new create add_team 
    describe "GET #new" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #create" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :create
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #add_team" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :add_team
            expect(response).to have_http_status(:success)
        end
    end
end
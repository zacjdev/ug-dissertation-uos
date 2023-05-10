RSpec.describe ChecklogController, type: :controller do
    describe "GET #index" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :index
            expect(response).to have_http_status(:success)
        end
    end
    describe "test new" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :new
            expect(response).to have_http_status(:success)
        end
    end

    describe "GET #create" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'student', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :create
            expect(response).to have_http_status(:success)
        end
    end
end

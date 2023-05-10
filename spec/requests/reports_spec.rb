RSpec.describe ReportsController, type: :controller do
    # new, create
    describe "GET #new" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :new, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #create" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :create, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end
end
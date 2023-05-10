RSpec.describe SurveyTemplatesController, type: :controller do
    describe "GET #index" do
        it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
        end
    end
    # new, create, show, edit, update, destroy
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
    describe "POST #create" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            post :create, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end
end

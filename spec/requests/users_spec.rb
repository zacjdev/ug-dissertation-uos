RSpec.describe UsersController, type: :controller do
    
      describe "GET #edit" do
     it "returns http success" do
        user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
        sign_in user
        get :edit, params: {id: user.id}
        expect(response).to have_http_status(:success)
        end
    end

    describe "GET #update" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :update, params: {id: user.id}
            expect(response).to have_http_status(:success)
        end
    end

end

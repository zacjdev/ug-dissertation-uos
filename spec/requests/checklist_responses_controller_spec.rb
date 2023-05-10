RSpec.describe ChecklistResponsesController, type: :controller do
     
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

    describe "Make new checklist response" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            get :new, params: {id: user.id}
            expect(response).to have_http_status(:success)

            checklist_template = ChecklistTemplate.create!(name: 'test', description: 'test', user_id: user.id)
            checklist_response = ChecklistResponse.create!(checklist_template_id: checklist_template.id, user_id: user.id)
            expect(checklist_response).to be_valid

            checklist_response = ChecklistResponse.create!(checklist_template_id: checklist_template.id, user_id: user.id)
            expect(checklist_response).to be_valid
            
        end 
    end
end
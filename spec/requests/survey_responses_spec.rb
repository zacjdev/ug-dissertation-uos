RSpec.describe SurveyResponsesController, type: :controller do
    # new create r_params

    # new
    describe "GET #new" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            survey_template = SurveyTemplate.create!(name: 'test', description: 'test', user_id: user.id)
            get :new, params: {id: survey_template.id}
            expect(response).to have_http_status(:success)
        end
    end

    # create
    describe "GET #create" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            survey_template = SurveyTemplate.create!(name: 'test', description: 'test', user_id: user.id)
            get :create, params: {id: survey_template.id}
            expect(response).to have_http_status(:success)
        end
    end

    # post create
    describe "POST #create" do
        it "returns http success" do
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            survey_template = SurveyTemplate.create!(name: 'test', description: 'test', user_id: user.id)
            post :create, params: {id: survey_template.id}
            expect(response).to have_http_status(:success)
        end
    end

end
RSpec.describe TeamsController, type: :controller do
    # show, t_params, assign_team, assign, create, new

    # show
    describe "GET #show" do
        it "returns http success" do 
            # login 
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # create team
            team = Team.create!(name: 'Team 1', lecturer_id: user.id)
            # get show
            get :show, params: {id: team.id}
            # expect response to be success
            expect(response).to have_http_status(:success)
        end
    end
    #create
    describe "GET #create" do
        it "returns http success" do 
            # login 
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # create team
            team = Team.create!(name: 'Team 1', lecturer_id: user.id)
            # get show
            get :create, params: {id: team.id}
            # expect response to be success
            expect(response).to have_http_status(:success)
        end
    end
    # new
    describe "GET #new" do
        it "returns http success" do 
            # login 
            user = User.create!(email: 'a@a.com', role: 'lecturer', password: 'Password1!', password_confirmation: 'Password1!')
            sign_in user
            # create team
            team = Team.create!(name: 'Team 1', lecturer_id: user.id)
            # get show
            get :new, params: {id: team.id}
            # expect response to be success
            expect(response).to have_http_status(:success)
        end
    end
endr
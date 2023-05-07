class TeamsController < ApplicationController
    def new
        @team = Team.new
        # pass in the cmodule ids
        @cmodule_ids = Cmodule.all.pluck(:id)
        render :'lecturer/add_team'
    end

    def create
        @team = Team.new(t_params)

        if @team.save
            redirect_to '/lecturer/modules', notice: 'Team was successfully created.'
        else
            render :new
        end
    end

    def assign
        @teams = Team.all.pluck(:id)
        @users = User.all.pluck(:id)
        @assign = UserTeamLinker.new
        render :'lecturer/teams/assign_teams'
    end


    def assign_team
        team_id = params["user_team_linker"]["team_id"]
        user_id = params["user_team_linker"]["user_id"]
        
        request_hash = {
            :user_id => user_id,
            :team_id => team_id
        }

        if UserTeamLinker.find_by(user_id: user_id, team_id: team_id)
            redirect_to '/lecturer/modules', notice: 'Already assigned.'
        else
            @assignment = UserTeamLinker.new(request_hash)
            @assignment.save

            redirect_to '/lecturer/modules', notice: 'Team was successfully assigned.'
        end
    end



    def show 
        @team = Team.where(id: params[:id]).first
        @cmodule = Cmodule.where(id: @team.name).first
        @alllinks = UserTeamLinker.where(team_id: params[:id])
        @users = User.all
        @reports = Report.where(team_id: params[:id])
        @checklogs = Checklog.where(team_id: params[:id])
        @teammembers = @users.where(id: @alllinks.pluck(:user_id))
        @responses = SurveyResponse.where(team_id: params[:id])
        
        # iterate @teammembers and get their responses
        totalPoints = {}
        totalPointsOfAll = 0
        # for each member iterate their total points given for all responses
        for member in @teammembers
            totalPoints[member.id] = 0
            @responsesOfMember = SurveyResponse.where(created_by: member.id)
            for response in @responsesOfMember
                totalPointsResponse = response.question1response.to_i + response.question2response.to_i + response.question3response.to_i + response.question4response.to_i + response.question5response.to_i

                totalPoints[member.id] += totalPointsResponse.to_i
                totalPointsOfAll += totalPointsResponse.to_i

            end
        end
        # output total points to console

        averagePointsGiven = totalPointsOfAll / @teammembers.length

        biasFactors = {}
        biasFactorsStrings = {}
        for member in @teammembers
            biasFactors[member.id] = (averagePointsGiven.to_d / totalPoints[member.id].to_d)
            biasFactorsStrings[member.id] = biasFactors[member.id].to_s
        end

        @biasfactors = biasFactorsStrings.to_s
        # Adjust points given to scale with bias factors
        weightedResponses = SurveyResponse.where(team_id: params[:id])

        for response in weightedResponses
            response.question1response = (response.question1response.to_f * biasFactors.fetch(response.created_by.to_i).to_f)
            response.question2response = (response.question2response.to_f * biasFactors.fetch(response.created_by.to_i).to_f)
            response.question3response = (response.question3response.to_f * biasFactors.fetch(response.created_by.to_i).to_f)
            response.question4response = (response.question4response.to_f * biasFactors.fetch(response.created_by.to_i).to_f)
            response.question5response = (response.question5response.to_f * biasFactors.fetch(response.created_by.to_i).to_f)
            puts response.inspect
        end 
        # iterate weighted responses and get totals for each user_id
        weightedScores = {}
        for response in weightedResponses
            totalScore = response.question1response.to_f + response.question2response.to_f + response.question3response.to_f + response.question4response.to_f + response.question5response.to_f
            weightedScores[response.user_id] = totalScore + weightedScores.fetch(response.user_id, 0).to_f
        end
        puts weightedScores.inspect
        totalWeightedScore = 0
        for score in weightedScores
            totalWeightedScore += score[1]
        end
        averageWeightedScore = totalWeightedScore / weightedScores.length
        puts averageWeightedScore

        multipliers = {}
        for score in weightedScores
            multipliers[score[0]] = score[1] / averageWeightedScore
        end
        puts multipliers.inspect + "multipliers"
        @multipliers = multipliers

        totalPointsGivenUnweightedToPerson = {}
        for response in @responses
            totalPointsGivenUnweightedToPerson[response.user_id] = response.question1response.to_i + response.question2response.to_i + response.question3response.to_i + response.question4response.to_i + response.question5response.to_i
        end
        puts totalPointsGivenUnweightedToPerson.inspect + "totalPointsGivenUnweightedToPerson"
        @totalpointsgiven = totalPointsGivenUnweightedToPerson.to_s
        abnormalMultiplierWarning = ""
        for mult in multipliers
            if mult[1] > 1.2 
                abnormalMultiplierWarning = "High or low multiplier"
            end 
            if mult[1] < 0.8
                abnormalMultiplierWarning = "High or low multiplier"
            end 
        end
        zeroWarning = ""
        for response in @responses
            # if any 0
            if response.question1response.to_i == 0 || response.question2response.to_i == 0 || response.question3response.to_i == 0 || response.question4response.to_i == 0 || response.question5response.to_i == 0
                abnormalMultiplierWarning = "0 given"
            end
        end
        @abnormalMultiplierWarning = abnormalMultiplierWarning
        @zeroWarning = zeroWarning



        render :'lecturer/teams/view'
        
        
    end

    def t_params 
        params.require(:team).permit(:name)
    end
end

# Path: app/controllers/users_controller.rb
# Compare this snippet from app/controllers/cmodules_controller.rb:
# class CmodulesController < ApplicationController
# 
#     def new
#         @mod = Cmodule.new
#         render :'lecturer/modules/new'
#     end
# 
#     def show
#         @cmodule = Cmodule.where(id: params[:id]).first
#         render :'lecturer/modules/view'
#     end
# 
#     def create
#         @mod = Cmodule.new(m_params)
# 
#         if @mod.save
#             redirect_to '/lecturer/modules', notice: 'Module was successfully created.'
#         else
#             render :new
#         end
#     end
# 
#     def add_team
#         @team = Team.new
#         render :'lecturer/modules/add_team'
#     end
# 
#     def m_params 
#         params.require(:cmodule).permit(:name)
#     end
# end
# Compare this snippet from app/controllers/index_controller.rb:
# class IndexController < ApplicationController
#     def index
#       if current_user.role == 'student'
#         redirect_to '/home'
#       elsif current_user.role == 'lecturer' || current_user.role == 'facilitator'
#         redirect_to '/dashboard'
#       else
#         render :'pages/no_access'
#       end
#     end
#   end
#   
# Compare this snippet from app/controllers/lecturer_controller.rb:
# class LecturerController < ApplicationController
#     def home
#         render :'lecturer/home'
#     end
# 
#     def modules
#         @cmodules = Cmodule.all
#         render :'lecturer/modules'
#     end
# 
#     def surveys
#         render :'lecturer/surveys'
#     end
# 
#     def checklists
#         render
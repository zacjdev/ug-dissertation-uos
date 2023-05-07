require 'rails_helper'

RSpec.describe Checklog, type: :model do
end

RSpec.describe Cmodule, type: :model do
end

RSpec.describe Team, type: :model do
end

RSpec.describe SurveyResponse, type: :model do
end 

RSpec.describe User, type: :model do
end

RSpec.describe SurveyTemplate, type: :model do
end

RSpec.describe Report, type: :model do
end 

RSpec.describe UserTeamLinker, type: :model do
end

RSpec.describe ChecklistTemplate, type: :model do
end

RSpec.describe ChecklistResponse, type: :model do
end 

# test user roles and abilities
RSpec.describe Ability, type: :model do
  let(:user) { User.new }

  subject(:ability) { Ability.new(user) }

  context 'when is a lecturer' do
    let(:user) { User.new(role: 'lecturer') }

    it { is_expected.to be_able_to(:manage, :all) }
  end

  context 'when is a facilitator' do
    let(:user) { User.new(role: 'facilitator') }

    it { is_expected.to be_able_to(:manage, :all) }
  end

  context 'when is a student' do
    let(:user) { User.new(role: 'student') }

    it { is_expected.to be_able_to(:manage, Report) }
    it { is_expected.to be_able_to(:manage, ChecklistResponse) }
  end
end

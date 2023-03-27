require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { build(:team) }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end

  describe "# not valid when ?" do
    it 'should be not valid when email nil' do
      subject.email = nil
    end

    it 'should be not valid when password nil' do
      subject.password = nil
    end

    it 'should be not valid when name nil' do
      subject.name = nil
    end

    after do
      expect(subject).to_not be_valid
    end
  end

  context 'create validation' do
    before(:each) do
      @team = subject
      @team.save
    end

    it 'will be not valid when email was not unique' do
      other_team = build(:team)
      expect(other_team).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

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

    it 'should be not valid when first_name nil' do
      subject.first_name = nil
    end

    after do
      expect(subject).to_not be_valid
    end
  end

  context 'create validation' do
    before(:each) do
      @user = subject
      @user.save
    end

    it 'will be not valid when email was not unique' do
      other_user = build(:user)
      expect(other_user).to_not be_valid
    end
  end
end

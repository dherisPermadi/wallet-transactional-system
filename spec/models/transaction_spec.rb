require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) {
    User.create(
      email: 'user-test@example.com',
      first_name: 'Jean',
      password: 'Password'
    )
  }
  let(:team) {
    Team.create(
      email: 'team-test@example.com',
      name: 'Team',
      password: 'Password'
    )
  }
  subject {
    Transaction.new(
      sourceable_id: user.id,
      sourceable_type: 'User',
      targetable_id: team.id,
      targetable_type: 'Team',
      transaction_type: 'transfer',
      amount: 5000
    )
  }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end

  describe "# not valid when ?" do
    it 'should be not valid when amount is equal 0' do
      subject.amount = 0
    end

    it 'should be not valid when amount is less than 0' do
      subject.amount = -0.1
    end

    after do
      expect(subject).to_not be_valid
    end
  end
end

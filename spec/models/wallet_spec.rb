require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:user) {
    User.create(
      email: 'user-test@example.com',
      first_name: 'Jean',
      password: 'Password'
    )
  }
  subject { Wallet.new(walletable_id: user.id, walletable_type: 'User') }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end
end

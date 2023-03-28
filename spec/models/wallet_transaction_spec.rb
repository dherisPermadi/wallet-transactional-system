require 'rails_helper'

RSpec.describe WalletTransaction, type: :model do
  let(:user) {
    User.create(
      email: 'user-test@example.com',
      first_name: 'Jean',
      password: 'Password'
    )
  }
  let(:wallet) { Wallet.create(walletable_id: user.id, walletable_type: 'User') }
  let(:transaction) {
    Transaction.create(
      sourceable_id: user.id,
      sourceable_type: 'User',
      transaction_type: 'deposit',
      amount: 10000
    )
  }
  subject {
    WalletTransaction.new(
      transaction_id: transaction.id,
      wallet_id: wallet.id,
      event: 'debit',
      amount: transaction.amount
    )
  }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end
end

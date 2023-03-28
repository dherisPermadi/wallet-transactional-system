require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:user) {
    User.create(
      email: 'user-test@example.com',
      first_name: 'Jean',
      password: 'Password'
    )
  }
  let(:indices_stock) { IndicesStock.create(name: 'NIFTY TEST') }
  let(:identifier_stock) {
    IdentifierStock.create(
      indices_stock_id: indices_stock.id,
      symbol_name: 'NIFTY TEST',
      name: 'NIFTY TEST 100'
    )
  }
  subject {
    Stock.new(
      identifier_stock_id: identifier_stock.id,
      stockable_type: 'User',
      stockable_id: user.id,
      quantity: 2,
      unit_price: 2500,
      total_price:5000
    )
  }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end

  describe "# not valid when ?" do
    it 'should be not valid when quantity is equal 0' do
      subject.quantity = 0
    end

    it 'should be not valid when quantity is less than 0' do
      subject.quantity = -0.1
    end

    it 'should be not valid when unit_price is equal 0' do
      subject.unit_price = 0
    end

    it 'should be not valid when unit_price is less than 0' do
      subject.unit_price = -0.1
    end

    it 'should be not valid when total_price is equal 0' do
      subject.total_price = 0
    end

    it 'should be not valid when total_price is less than 0' do
      subject.total_price = -0.1
    end

    after do
      expect(subject).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe IdentifierStock, type: :model do
  let(:indices_stock) { IndicesStock.create(name: 'NIFTY TEST') }
  subject {
    IdentifierStock.new(
      indices_stock_id: indices_stock.id,
      symbol_name: 'NIFTY TEST',
      name: 'NIFTY TEST 100'
    )
  }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end

  describe "# not valid when ?" do
    it 'should be not valid when symbol_name nil' do
      subject.symbol_name = nil
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
      @identifier_stock = subject
      @identifier_stock.save
    end

    it 'will be not valid when identifier was not unique' do
      other_identifier_stock = IdentifierStock.new(
        indices_stock_id: indices_stock.id,
        symbol_name: 'NIFTY TEST',
        name: 'NIFTY TEST 100'
      )
      expect(other_identifier_stock).to_not be_valid
    end
  end
end

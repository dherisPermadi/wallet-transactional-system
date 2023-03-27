require 'rails_helper'

RSpec.describe IdentifierStock, type: :model do
  subject { build(:identifier_stock) }

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
      other_identifier_stock = build(:identifier_stock)
      expect(other_identifier_stock).to_not be_valid
    end
  end
end

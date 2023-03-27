require 'rails_helper'

RSpec.describe IndicesStock, type: :model do
  subject { build(:indices_stock) }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end

  describe "# not valid when ?" do
    it 'should be not valid when name nil' do
      subject.name = nil
    end

    after do
      expect(subject).to_not be_valid
    end
  end

  context 'create validation' do
    before(:each) do
      @indices_stock = subject
      @indices_stock.save
    end

    it 'will be not valid when name was not unique' do
      other_indices_stock = build(:indices_stock)
      expect(other_indices_stock).to_not be_valid
    end
  end
end

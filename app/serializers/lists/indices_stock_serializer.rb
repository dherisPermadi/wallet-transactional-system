module Lists
  # serializer class for list of indices stock
  class IndicesStockSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end

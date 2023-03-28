module Lists
  # serializer class for list of transaction
  class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :sourceable_id, :sourceable_type, :transaction_type,
             :amount, :targetable_id, :targetable_type
  end
end

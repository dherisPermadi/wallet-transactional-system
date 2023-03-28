# serializer class for transaction
class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :sourceable_id, :sourceable_type, :sourceable_balance,
             :transaction_type, :amount, :targetable_id, :targetable_type,
             :targetable_balance, :created_at, :updated_at, :wallet_transactions
end

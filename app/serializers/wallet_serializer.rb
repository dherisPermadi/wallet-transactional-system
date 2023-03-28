# serializer class for wallet
class WalletSerializer < ActiveModel::Serializer
  attributes :id, :walletable_id, :walletable_type, :balance,
             :created_at, :updated_at
end

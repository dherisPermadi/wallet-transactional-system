# serializer class for team
class TeamSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :created_at, :updated_at
end

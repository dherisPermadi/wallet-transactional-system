module Lists
  # serializer class for list of team
  class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end

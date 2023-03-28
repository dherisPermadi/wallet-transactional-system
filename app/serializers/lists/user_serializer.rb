module Lists
  # serializer class for list of user
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end

class UserSerializer < ActiveModel::Serializer
  has_many :orders
  attributes :id, :name, :email
end

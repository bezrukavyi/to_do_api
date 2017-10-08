class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :email, :provider, :uid
end

class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name
end


#UserSerializer.new(#user).serializable_hash[:data][:attributes]
# replace #user with the actual variable containing the user information.


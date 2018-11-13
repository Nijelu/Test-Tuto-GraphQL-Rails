# class Types::ItemType < Types::BaseObject
#   graphql_name 'ItemType'
#   description 'Type definition for items'

#   field :id, ID, null: false
#   field :name, String, null: false
#   field :done, Boolean, null: true
# end

module Types
  ItemType = GraphQL::ObjectType.define do
    name 'ItemType'
    description 'Type definition for items'

    field :id, !types.ID
    field :name, !types.String
    field :done, types.Boolean
  end
end
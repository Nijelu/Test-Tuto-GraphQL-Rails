# class Types::QueryType < Types::BaseObject
#   graphql_name 'Query'
  
#   ### TODO LIST QUERY
#   field :todo_lists, [Types::TodoListType], null: true do
#     description 'returns all todo lists'
#   end
#   field :todo_list, Types::TodoListType, null: true do
#     description 'returns the queried todo list'
#     argument :id, ID, required: true
#   end
  
#   def todo_lists
#     TodoList.all
#   end
  
#   def todo_list(args)
#     TodoList.find_by!(id: args[:id])
#   end
  
#   ### ITEM QUERY
#   field :items, [Types::ItemType], null: true do
#     description 'returns all items'
#   end
  
#   def items
#     Item.all
#   end
# end

module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'Query'
    root_type.description = 'The query root'
    root_type.interfaces = []
    root_type.fields = Util::FieldCombiner.combine([
      QueryTypes::TodoListQueryType,
      QueryTypes::ItemQueryType
    ])
  end
end
  

# class Types::QueryType < GraphQL::Schema::Object
#   field :projects, [Types::ProjectType], null: false do
#     description 'Find all the projects'
#   end

#   field :project, Types::ProjectType, null: true do
#     description 'Find a project by slug'
#     argument :slug, String, required: true
#   end

#   def projects
#     Project.all
#   end

#   def project(args)
#     Project.find_by(slug: args[:slug])
#   end
# end
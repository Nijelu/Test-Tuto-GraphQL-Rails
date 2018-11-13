RSpec.describe Types::TodoListType do
    # avail type definer in our tests
    types = GraphQL::Define::TypeDefiner.instance

    it 'has an :id field of ID type' do
        # ensure that the field id is of type ID
        expect(subject).to have_field(:id).that_returns(!types.ID)
    end

    it 'has an :title field of String type' do
        # ensure the field is of String type
        expect(subject).to have_field(:title).that_returns(!types.String)
    end
end
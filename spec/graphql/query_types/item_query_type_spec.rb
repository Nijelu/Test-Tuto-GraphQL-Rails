RSpec.describe QueryTypes::ItemQueryType do
    # avail type definer in our tests
    types = GraphQL::Define::TypeDefiner.instance
    # create fake items using the item factory
    let!(:items) { create_list(:item, 3) }
    
    describe 'querying all items' do
  
      it 'has a :items that returns a Item type' do
        expect(subject).to have_field(:items).that_returns(types[Types::ItemType])
      end
  
      it 'returns all our created items' do
        query_result = subject.fields['items'].resolve(nil, nil, nil)
  
        # ensure that each of our items is returned
        items.each do |list|
          expect(query_result.to_a).to include(list)
        end
  
        # we can also check that the number of lists returned is the one we created.
        expect(query_result.count).to eq(items.count)
      end
    end
  end
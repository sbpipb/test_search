require 'rspec/autorun'
require 'byebug'
require_relative './query'

describe Query do
  describe '#by_name' do
    context 'with a keyword that has two matches' do
      it 'searches for a match in full_name attribute' do
        query = Query.new(keyword: 'Jane', file: 'clients.json')
        expect(query.by_name).to match_array(
          [{
            id: 2,
            full_name: 'Jane Smith',
            email: 'jane.smith@yahoo.com'
          },
           {
             id: 15,
             full_name: 'Another Jane Smith', email: 'jane.smith@yahoo.com'
           }]
        )
      end
    end

    context 'with a record that has a single match' do
      it 'searches by name' do
        query = Query.new(keyword: 'Emily', file: 'clients.json')
        expect(query.by_name).to match_array(
          [
            {
              "id": 5,
              "full_name": 'Emily Brown',
              "email": 'emily.brown@aol.com'
            }
          ]
        )
      end
    end

    context 'with a record with no match' do
      it 'returns empty' do
        query = Query.new(keyword: 'Jolianism', file: 'clients.json')
        expect(query.by_name).to match_array(
          []
        )
      end
    end
  end
end

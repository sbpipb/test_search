require 'json'

class Query
  attr_reader :data, :attribute

  def initialize(file: 'clients.json')
    file = File.read(file)
    @data = JSON.parse(file, symbolize_names: true)
  end

  def by_name(keyword:)
    keyword = keyword.downcase
    @attribute = :full_name
    @data.select { |x| x[attribute].downcase.include? keyword }
  end

    # Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found. 
  def by_email
    @attribute = :email
    @data.find_all { |x| @data.map { |x| x[@attribute] }.count(x[attribute]) > 1 }
  end
end

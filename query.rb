require 'json'

class Query
  attr_reader :keyword, :data, :attribute

  def initialize(keyword:, file: 'clients.json')
    @keyword = keyword.downcase
    file = File.read(file)
    @data = JSON.parse(file, symbolize_names: true)
  end
  
  def by_name
    @attribute = :full_name
    @data.select { |x| x[attribute].downcase.include? keyword }
  end

  def by_email; end
end

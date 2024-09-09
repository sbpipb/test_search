require 'json'

class Query
  attr_reader :keyword, :clients, :attribute

  def initialize(keyword:, file: 'clients.json')
    @keyword = keyword.downcase
    file = File.read(file)
    @clients = JSON.parse(file, symbolize_names: true)
  end

  def by_name
    @attribute = :full_name
    @clients.select { |x| x[attribute].downcase.include? keyword }
  end

  def by_email; end
end

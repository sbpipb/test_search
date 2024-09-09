#!/usr/bin/env ruby
require 'byebug'
require 'json'

def main
  file = File.read('clients.json')
  clients = JSON.parse(file)
  Query.new(clients: clients).by_name
end

#  Search through all clients and return those with names partially matching a given search query 
def search_name(keyword = 'john', attribute = 'full_name')
  # json = main
  # puts json.select { |x| x[attribute].downcase.include? keyword }
end

def search_email
  # Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found. 
end


main if __FILE__ == $PROGRAM_NAME
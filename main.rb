#!/usr/bin/env ruby
require 'byebug'
require 'json'
require_relative './query'

def main
  file = File.read('clients.json')
  clients = JSON.parse(file)
  Query.new(clients:).by_name
end

#  Search through all clients and return those with names partially matching a given search query
def search_name(keyword)
  puts Query.new.by_name(keyword:)
end

def search_email
  # Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.
end

if ARGV.empty?
  puts 'Usage: ruby main.rb <keyword>'
  exit
end

search_name(ARGV[0])

# search_name if __FILE__ == $PROGRAM_NAME

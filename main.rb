#!/usr/bin/env ruby
require 'json'
require_relative './query'

#  Search through all clients and return those with names partially matching a given search query
def search_name(keyword)
  Query.new.by_name(keyword:)
end

# Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.
def search_email
  Query.new.by_email
end

if ARGV[0] == 'name' && ARGV[1]
  puts search_name(ARGV[1])
elsif ARGV[0] == 'email'
  puts search_email
else
  puts 'Usage: ruby main.rb name <keyword> # to search for name based on keyword'
  puts 'Usage: ruby main.rb email # to search for records with duplicate emails'
  exit
end

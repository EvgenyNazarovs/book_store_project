equire('sinatra')
require('sinatra/contrib/all') if development?
require('pry')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require_relative('../models/publisher.rb')
also_reload('../models/*')

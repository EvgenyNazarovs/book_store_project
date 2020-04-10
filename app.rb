require('sinatra')
require('sinatra/contrib/all') if development?
require('pry')
require_relative('controllers/authors_controller')
require_relative('controllers/books_controller')
require_relative('controllers/publishers_controller')

get '/' do
  redirect to ('/authors/')
end

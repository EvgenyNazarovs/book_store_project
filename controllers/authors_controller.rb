require('sinatra')
require('sinatra/contrib/all') if development?
require('pry')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require_relative('../models/publisher.rb')
also_reload('../models/*')

# view

get '/authors/' do
  @authors = Author.all
  erb(:'authors/index')
end

# add

get 'authors/new' do
  erb(:'authors/new')
end

post 'authors/add' do
  author = Author.new(params)
  author.save
  erb(:'authors/index')
end

# edit

post 'authors/edit' do
  author = Author.find_by_id(params[:id])
  author.update
  erb(:'authors/')
end

get 'authors/:id/delete' do
  @author = Author.find_by_id(params[:id])
  erb(:'authors/delete')
end

get 'authors/:id/edit' do
  @author = Author.find_by_id(params[:id])
  erb(:'/authors/edit')
end

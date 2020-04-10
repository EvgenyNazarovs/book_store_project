require_relative('../models/author.rb')
require('pry-byebug')

author1 = Author.new({'first_name' => 'Philip',
                      'last_name' => 'Roth'})

author1.save



binding.pry
nil

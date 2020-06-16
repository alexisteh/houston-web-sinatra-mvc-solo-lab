
require_relative "./puppies_controller.rb"

class ApplicationController < Sinatra::Base
  use PuppiesController 
  configure do
      set :views, 'app/views'
      set :method_override, true
  end 
  
  get '/' do
      erb :welcome
  end

end


class PuppiesController < Sinatra::Base 
    configure do
        set :views, 'app/views'
        set :method_override, true
    end 
    
    get '/puppies' do 
        @all_pups = Puppy.all 
        erb :index 
      end 
    
      post '/puppies' do 
        puppy = Puppy.create(params)
        redirect "/puppies/#{puppy.id}"
      end 
    
      delete '/puppies/:id/delete' do 
        puppy=  find_pup(params)
        puppy.destroy
        redirect '/puppies'
      end 
    
      get '/puppies/new' do 
        erb :new 
      end 
    
      get '/puppies/:id' do 
        @puppy = find_pup(params) 
        erb :show 
      end 
    
      patch '/puppies/:id' do 
        puppy = find_pup(params) 
        puppy.update(name: params[:name], breed: params[:breed]) 
        redirect "/puppies/#{puppy.id}" 
      end 
    
      get '/puppies/:id/edit' do 
        @puppy = find_pup(params) 
        erb :edit 
      end 
    
      get '/puppies/:id/delete' do 
        @puppy = find_pup(params) 
        erb :delete 
      end 
    
      def find_pup(params)
        Puppy.all.find(params[:id]) 
      end 

end
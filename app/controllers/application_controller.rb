require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/artists' do

    @artists = Artist.all #define instance variable for view
  
    erb :index #show all artists view (index)
  end

  get '/artists/new' do

    erb :new #show new artists view
  
  end

  get '/artists/:id' do

    #gets params from url
  
    @artist = Artist.find(params[:id]) #define instance variable for view
  
    erb :show #show single artist view
  
  end

  delete '/artists/:id' do
    binding.pry
    #get params from url
    Artist.destroy(params[:id]) #define variable to edit
    
    redirect "/artists"
  
  end

  patch '/artists/:id' do
    # binding.pry
    #get params from url
    @artist = Artist.find(params[:id]) #define variable to edit
  
    @artist.update(params[:artist]) #assign new attributes
  
    redirect "/artists/#{@artist.id}"
  
  end

  

  post '/artists' do
    # binding.pry
    #below works with properly formatted params in HTML form
    @artist = Artist.create(params[:artist]) #create new artist
    
    redirect "/artists/#{@artist.id}"
  
  end

  get '/artists/:id/edit' do

    #get params from url
    @artist = Artist.find(params[:id]) #define intstance variable for view
  
    erb :edit #show edit artist view
  
  end

  
  

end

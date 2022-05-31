require 'pry'
#enable :sessions

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
  end

  post '/login' do
    user = User.find_by(username: params[:username], 
                        password: params[:password])
    if user 
      true.to_json
    else
      status 400
      false.to_json
    end
  end

  #get '/logout' do
  #end
  
  post '/signup' do
    User.create(username: params[:username],
                password: params[:password],
                name: params[:name]
               )
  end

  patch '/user/:id' do
    user = User.find(params[:id])
    params.each do |key, value|
      unless key == "id"
        user.update("#{key}": value)
      end
    end
    "success".to_json
  end

  delete '/user/:id' do
    User.find(params[:id]).destroy
  end

  get '/user/:id' do
    user = User.find(params[:id]) 
    user.to_json(only: [:id, :name], include: :exercises)
  end
end

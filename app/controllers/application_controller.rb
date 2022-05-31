require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post '/login' do
    username = params[:username]
    password = params[:password]
    User.exists?(username: username) ?
      User.login(username, password).to_json : 'invalid username'.to_json
  end
  
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

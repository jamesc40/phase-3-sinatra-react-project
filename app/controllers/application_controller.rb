class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post '/login' do
    username = params[:username]
    password = params[:password]
    User.exists?(username: username) ?
      User.login(username, password).to_json : 'invalid username'.to_json
  end

end

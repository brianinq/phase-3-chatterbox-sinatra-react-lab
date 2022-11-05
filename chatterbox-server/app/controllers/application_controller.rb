class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get "/" do
    "hello"
  end
  get "/messages" do
    Message.all_ordered.to_json
  end
  post "/messages" do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end
  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end
  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end

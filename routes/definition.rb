class ShoeStore < Sinatra::Application

  get '/definition' do
    haml :definition
  end

end
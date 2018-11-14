require 'sinatra/base'

class Api < Sinatra::Base
  get '/' do
    ""
  end
  
  get '/json' do
    content_type :json
    '{"a":{"b":{"c":1}, "d":2}}'
  end
end

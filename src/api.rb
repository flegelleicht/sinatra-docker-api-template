require 'sinatra/base'

class Api < Sinatra::Base
  
  before '*' do
    headers "Access-Control-Allow-Origin"   => "*" #FIXME: Control this better!
  end
  
  options '*' do
    headers "Allow" => "GET, POST, PUT, OPTIONS"
    headers "Access-Control-Allow-Headers"  => "access-control-allow-origin, authorization"
    headers "Access-Control-Allow-Origin"   => "*" #FIXME: Control this better!
    headers "Access-Control-Allow-Methods"  => "GET, POST, PUT, DELETE, OPTIONS"
    halt 200
  end
  
  get '/' do
    ""
  end
  
  get '/json' do
    content_type :json
    '{"a":{"b":{"c":1}, "d":2}}'
  end
  
  get '/ui' do
    content_type :html
    '<h1 class="sans">Input</h1><input type="text" value="Hello World!" placeholder="Neu" />'
  end
end

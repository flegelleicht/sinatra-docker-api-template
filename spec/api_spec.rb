ENV['RACK_ENV'] = 'test'

require File.expand_path '../../src/api.rb', __FILE__
require 'rack/test'

describe "Api" do
  include Rack::Test::Methods
  def app() 
    Api 
  end
  subject { '{"a":{"b":{"c":1}}}' }
    
  it "should return nothing successfully from root" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('')
  end
  
  it "should return basic json information" do
    get '/json'
    expect(last_response.content_type).to eq('application/json')
    
    json = nil
    expect { json = JSON.parse(last_response.body) }.not_to raise_exception
    expect(json).to match({"a" => {"d" => 2, "b" => { "c" => 1 }}})
  end
end

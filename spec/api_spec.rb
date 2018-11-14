ENV['RACK_ENV'] = 'test'

require File.expand_path '../../api.rb', __FILE__
require 'rack/test'

describe "Api" do
  include Rack::Test::Methods
  def app() Api end
    
  it "should return nothing successfully from root" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('')
  end
end

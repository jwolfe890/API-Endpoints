require 'rails_helper'
require 'faker'

RSpec.describe "UrlContents API", type: :request do
 
    before { FactoryBot.create_list(:url_content, 3) }
 
describe 'GET /url_contents' do
    before { get '/url_contents'}

    it 'returns a status code of 200' do 
        expect(response).to have_http_status(200)
    end
    
    it 'returns an array of content in JSON' do 
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).not_to be_empty
        expect(json.size).to eq(3)
    end 

end

describe 'POST /url_contents' do

context 'when the url is valid' do
    before { post '/url_contents', params: { url: "www.google.com" } }

    it 'returns a status code of 201' do 
        expect(response).to have_http_status(201)
    end
    end 

end

end



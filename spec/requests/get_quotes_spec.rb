require 'rails_helper'

describe "get all quotes route", :type => :request do
 it 'returns all quotes' do
   FactoryGirl.create_list(:quote, 20)
   get '/quotes'
   expect(JSON.parse(response.body).size).to eq(20)
   expect(response).to have_http_status(:success)
 end
end

describe "get a single quote route", :type => :request do
  it 'returns a single quote' do
    quote = FactoryGirl.create(:quote)
    get "/quotes/#{quote.id}"
    expect(response).to be_success
    expect(JSON.parse(response.body)['content']).to eq(quote.content)
  end
end

# this syntax streamlines tests, showing fewer tests in the end but each one covers all aspects of the desired behavior.

# Here is the lesson version, which tests only the first block but shows more tests as passed in console.
# describe "get all quotes route", :type => :request do
#   let!(:quotes) { FactoryGirl.create_list(:quote, 20)}
#
#   before { get '/quotes'}
#
#   it 'returns all quotes' do
#     expect(JSON.parse(response.body).size).to eq(20)
#   end
#
#   it 'returns status code 200' do
#     expect(response).to have_http_status(:success)
#   end
# end

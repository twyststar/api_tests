require 'rails_helper'

describe 'post a quote route', :type => :request do

  before do
    post '/quotes', params: { :author => 'test_author', :content => 'test_content' }
  end

  it 'returns the authors name' do
    expect(JSON.parse(response.body)['author']).to eq('test_author')
  end

  it 'returns the content of the quote' do
    expect(JSON.parse(response.body)['content']).to eq('test_content')
  end

  it 'returns a created success status' do
    expect(response).to have_http_status(:created)
  end

end

describe 'post a quote route', :type => :request do

  before do
    post '/quotes', params: { :author => '', :content => 'test_content' }
  end

  it 'returns an exception status if required param is missing' do
    expect(response).to have_http_status(:unprocessable_entity)
  end

end

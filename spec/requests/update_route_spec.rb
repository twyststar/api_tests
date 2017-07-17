describe "updates a quote route", :type => :request do
  it 'updates a quote' do
    quote = FactoryGirl.create(:quote)
    patch :update, {id: quote.id, quote: { content: 'test_content'}}
    expect(response).to be_success
    expect(JSON.parse(response.body)['content']).to eq('test_content')
  end
end

require 'rails_helper'

RSpec.describe Notification, type: :request do

  it "creates a Notification" do
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/notifications", 
    :params => 
    { :notification => 
      { 
        :phone => "5555555555", 
        :body => "My message", 
        :source_app => "my_app_name"
      } 
    }, :headers => headers


    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it 'renders an error status if the notification was not created' do 
    header = {
      "ACCEPT" => "application/json"
    }

    post "/notifications",
    :params =>
    { :notification =>
     {
        :phone => "5555555555",
        :body => "My Message"
      }
    }, :headers => headers 

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'sends a test message via the Twilio API after a notication is created' do 
    headers = {
      "ACCEPT" => "application/json"
    }

    post "/notifications", 
    :params => 
    { :notification => 
      { 
        :phone => "1234567890", 
        :body => "My message", 
        :source_app => "my_app_name"
      } 
    }, :headers => headers
    
    expect(FakeSms.message.last.num).to eq("1234567890")
  end

end


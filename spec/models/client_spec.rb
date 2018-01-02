require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
  	@client = FactoryBot.build_stubbed(:client)
  end

  describe 'creation' do
    it 'can be created' do 
      expect(@client).to be_valid
    end
  end

  describe 'validations' do 
  	it 'can not be created if not valid' do
  		@client.source_app = nil
  		@client.api_key = nil
  		expect(@client).to_not be_valid
  	end
  end
end

require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'creation' do
    it 'can be created' do
      notification = FactoryBot.build_stubbed(:notification)
      expect(notification).to be_valid
    end
  end

  describe 'validatons' do
  	before 	{ @notification = FactoryBot.build_stubbed(:notification) }


  	it 'can be created if vaild' do
	  	@notification.phone = nil
	  	@notification.body = nil
	  	@notification.source_app = nil
	  	expect(@notification).to_not be_valid
	end

	it 'requires the phone attribute to contain a string of integers' do
		@notification.phone = "atextphonenumber"
		expect(@notification).to_not be_valid
    end

    it 'requires the phone attribute to only have 10 characters' do
    	@notification.phone = "12345678910"
    	expect(@notification).to_not be_valid
    end

    it 'limits the body attribute to 160 characters' do
    	@notification.body = "word" * 50
    	expect(@notification).to_not be_valid
    end
  end
end

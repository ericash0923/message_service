class Client < ApplicationRecord
	validates_presence_of :source_app, :api_key
end

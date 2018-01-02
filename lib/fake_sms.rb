module FakeSms
	Message = Struct.new(:num, :msg, :app)
	@message = []

	def self.send_sms(num, msg, app)
		@message << Message.new(num, msg, app)
	end

	def self.message
		@message
	end
end

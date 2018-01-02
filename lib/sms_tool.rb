module SmsTool
  def self.send_sms(num, msg, app)
    puts "Sending message..."
    puts "#{msg} to #{num} from #{app}"
  end
end
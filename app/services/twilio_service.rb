class TwilioService
def initialize(user)
	#debugger
    @number = number
  end

  def send_pin
		#debugger
       	twilio_client=Twilio::REST::Client.new('AC3392c35941642041a08a339768f831f5', '553db13b9a85bdf719d3d327f39e6355')
		#debugger
  		twilio_client.messages.create(
    	to:  phone_number,
    	from: +13343199703,
    	body: "Your PIN is #{pin}"
  )
	end

end
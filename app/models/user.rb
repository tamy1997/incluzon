class User < ApplicationRecord
  has_many :students
  has_one :college
  after_create :update_user
  validates :name, :address, :city, :state, :country, :website, :authority_name, :presence => true
  validates :pincode, :presence => true, numericality: true
  validates :number, :presence => true, :length => {:maximum => 12,:minimum =>12, :message => "Invalid number and use +91 with the number"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def update_user
  	@user = User.find(self.id)
  	@user.generate_pin
  	@user.send_pin
  end

 def generate_pin
  		self.pin = rand(0000..9999).to_s.rjust(4, "0")
  		save
  end

def verify(entered_pin)
	update(verified: true) if self.pin == entered_pin
end

  def send_pin
    UserMailer.with(user: self).confirm_mail.deliver_now
      twilio_client=Twilio::REST::Client.new('AC3392c35941642041a08a339768f831f5', '553db13b9a85bdf719d3d327f39e6355')
		  twilio_client.messages.create(
    	to:  self.number,
    	from: +13343199703,
    	body: "Your PIN is #{pin}"
    )
	end
end

require 'twilio-ruby'

class Takeaway

	attr_reader :menu

	def initialize 

		@menu = {"1. Lamb Biryani" => 5,
				"2. Chicken Biryani"=> 6,
				"3. Cucumber Raita" => 2,
				"4. Veg Samosas" => 2,
				"5. Gulab Jamun"=> 3,
				"6. Mango Kulfi" => 3,
				"7. Sweet Lassi" => 2}

	end

	def place_order item1, qty_item1, item2, qty_item2, total_qty
		return "Sorry, incorrect total provided" if incorrect_total? qty_item1, qty_item2, total_qty
		confirm_order 
	end

	def incorrect_total? qty_item1, qty_item2, total_qty
		total_qty != qty_item1 + qty_item2
	end

	def confirm_order
		account_sid = "AC1ce11f5c53a289f94beeb1947afa9c78"
		auth_token = "97728e9210402937f8cc85e9a5b2650f"
		message_body = "Thank you! Your order has been placed and will be delivered before #{Time.new.hour + 1}.#{Time.new.min}."

		@client = Twilio::REST::Client.new account_sid, auth_token

		@message = @client.account.messages.create({:to => "+447827830663",
                                   :from => "+441384901189",
                                   :body => message_body})

	#confirm that the message has been sent	
	end

end
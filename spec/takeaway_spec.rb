require 'takeaway'

describe 'takeaway' do

	let(:curry_palace) {Takeaway.new}

	context 'maintaining database of prices' do

		it 'makes sure that the number of items in the menu is correct' do
			expect(curry_palace.menu.count).to eq 7
		end	

		it 'makes sure the correct price is displayed' do
			expect(curry_palace.menu["4. Veg Samosas"]).to eq 2 
		end
	end

	context 'Placing an order' do

		it 'raises an error if incorrect total of quantities is provided' do
			expect(curry_palace.place_order(1,2,7,3,6)).to eq "Sorry, incorrect total provided"
		end

		it 'customer mobile number is valid' do
			curry_palace.confirm_order
			expect(curry_palace.customer_mobile_number.length).to eq 13
			expect(curry_palace.customer_mobile_number[0]).to eq("+")
		end

		#to check with Enrique
		# it 'sends an sms to confirm an order' do
		# 	expect(curry_palace.confirm_order).to_not raise_error("Twilio::REST::RequestError:")
		# end

		# it 'executes the order confirmation process if the order is correctly placed' do
		# 	expect(takeaway_double.place_order(1,2,7,3,5)).to eq confirm_order
		# end
	
	end
	
end
require 'takeaway'

describe 'takeaway' do

	let(:takeaway) {Takeaway.new}
	# let(:takeaway_double) {double :Takeaway}
	# add stubs and mocks to test the class

	context 'maintaining database of prices' do

		it 'makes sure that the number of items in the menu is correct' do
			expect(takeaway.menu.count).to eq 7
		end	

		it 'makes sure the correct price is displayed' do
			expect(takeaway.menu["4. Veg Samosas"]).to eq 2 
		end
	end

	context 'Placing an order' do

		it 'raises an error if incorrect total of quantities is provided' do
			expect(takeaway.place_order(1,2,7,3,6)).to eq "Sorry, incorrect total provided"
		end

		# it 'sends an sms to confirm an order' do
		# 	expect(takeaway.confirm_order).to_not raise_error("Twilio::REST::RequestError:")
		# end

		# it 'executes the order confirmation process if the order is correctly placed' do
		# 	expect(takeaway_double.place_order(1,2,7,3,5)).to eq confirm_order
		# end
	
	end
	
end
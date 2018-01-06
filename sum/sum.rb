require 'sinatra'
require 'rubygems'
require 'json'


get '/' do
  erb :form
end

post '/sum' do

	low = params[:mini].to_i   	#set minimum and maximum to low and high
	high = params[:maxi].to_i
	if(low > high)				#switched high and low if user entered numbers in reverse order
		a = high
		high = low
		low = a 
	end

	if(low < 0 or high > 1000000)	#error message if range is outside 0 and 1000000
		"Please enter a range from 0 to 1000000"
	elsif (((high - low) + 1) < 4)	 #error if the range is too small, i.e cannot make 4 unique options
		"Please enter a wider ranger"
	else	
		correct = low + rand((high-low) + 1)	 #set the correct answer using rand (inclussive of upper and lower bounds)
		add_1 = rand(correct)					#random number less than the answer is first part of the question
		add_2 = correct - add_1					#subtract from correct answer to get second part
		ques = add_1.to_s + " + " + add_2.to_s 	#make the question as a string
		opt1 = low + rand((high-low) + 1)		#set opt1, opt2 and opt3 same as correct
		opt2 = low + rand((high-low) + 1)
		opt3 = low + rand((high-low) + 1)
		while(opt1 == correct)			#loop till opt1 is not the same as the correct answer
			opt1 = low + rand((high-low) + 1)
	   	end
		while (opt2 == correct or opt2 == opt1)	#loop till opt2 is unique
			opt = low + rand((high-low) + 1)
		end
		while (opt3 == correct or opt3 == opt1 or opt3 == opt2) #loop till opt2 is unique
			opt3 = low + rand((high-low) + 1)
		end
		content_type :json #set content type to json and output the relevant information
		{ :question => ques, :answer => correct, :opt1 => opt1, :opt2 => opt2, :opt3 => opt3  }.to_json
	end
end
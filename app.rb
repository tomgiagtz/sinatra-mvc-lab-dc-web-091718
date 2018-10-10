require_relative 'config/environment'

class App < Sinatra::Base

	get '/' do
		erb :user_input
	end

	post '/piglatinize' do
		pig_latinizer = PigLatinizer.new
		@result = pig_latinizer.piglatinize(params[:user_phrase])

		erb :show_result
	end

end

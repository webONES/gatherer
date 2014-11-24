
class TwitterController < ApplicationController
	before_action :get_twitter_token
	def publish
		@twitter_client.update("I'm happy!")
	end
end


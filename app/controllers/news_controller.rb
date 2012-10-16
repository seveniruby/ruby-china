class NewsController < ApplicationController
	def index
		if Time.now-AppConfig[:feed_get_time]>600
			require 'open-uri'
			@entries=JSON.parse(open(AppConfig[:feed_url]).read)["responseData"]["feed"]["entries"]
			AppConfig[:feed_get_time]=Time.now
			AppConfig[:feed]=@entries
		else
			@entries=AppConfig[:feed]
		end

	end
end

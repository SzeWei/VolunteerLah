class HomeController < ApplicationController
	def home
		render file: "home/home"
	end
end
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def hello
		render html: "Jello worlds¡"
	end

	def goodbye
		render html: "goodbye, world!"
	end
end


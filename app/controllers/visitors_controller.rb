class VisitorsController < ApplicationController

	def new
		#Rails.logger.debug 'DEBUG: entering new method'
		@owner = Owner.new
		#Rails.logger.debug 'DEBUG: owner name is ' + @owner.name
		#raise 'deliberate Failure'
	end
end
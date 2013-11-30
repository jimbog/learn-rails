class VisitorsController < ApplicationController

	def new
		#Rails.logger.debug 'DEBUG: entering new method'
		@visitor = Visitor.new
		#flash[:notice] = 'Welcome!'
		#flash[:alert] = 'My birthday is soon.'
		#flash[:warning] = 'A tornado!'
		
		#Rails.logger.debug 'DEBUG: owner name is ' + @owner.name
		#raise 'deliberate Failure'
	end

	def create
		@visitor = Visitor.new(secure_params)
		if @visitor.valid?
			@visitor.subscribe
			flash[:notice] = "Signed up #{@visitor.email}."
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def secure_params
		params.require(:visitor).permit(:email)
	end

end
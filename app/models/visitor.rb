class Visitor < ActiveRecord::Base
	has_no_table
	column :email, :string
	validates :email, :presence => true
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	def subscribe
		mailchimp = Gibbon::API.new
		Rails.logger.debug "MailChimp is #{mailchimp}"
		Rails.logger.info "step 1 value is #{ENV['ADMIN_EMAIL']}"
		result = mailchimp.lists.subscribe({
			:id => ENV['MAILCHIMP_LIST_ID'],
			:email => {:email => self.email},
			:double_optin => false,
			:update_existing => true,
			:send_welcome => true
			})
		Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
	end
	
	
end
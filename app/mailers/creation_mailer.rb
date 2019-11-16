class CreationMailer < ApplicationMailer
	default from: ENV['admin_email']

  def creation_email
  	@to = ENV['admin_email']
    @record = params.try([:record]) || {}
    mail(to: @to, subject: "#{@record.class.name}. New record was created.")
  end	
end

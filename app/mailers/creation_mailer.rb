class CreationMailer < ApplicationMailer
	default from: ENV['admin_email']

  def creation_email
  	@email = ENV['admin_email']
    @record = params[:record]
    mail(to: @email, subject: "#{@record.class.name}. New record was created")
  end	
end

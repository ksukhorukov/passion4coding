# frozen_string_literal: true

module CreationEmail
  extend ActiveSupport::Concern

  included do
    def creation_email
      mailer = ::CreationMailer.new
      CreationMailer.with(record: self).creation_email.deliver_later
    end
  end
end

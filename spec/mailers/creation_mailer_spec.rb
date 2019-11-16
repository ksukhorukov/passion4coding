# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreationMailer, type: :mailer do
  let(:mail) { CreationMailer.with(record: Vertical.create(name: FFaker::Lorem.sentence)).creation_email }

  describe 'notify by email after records creation' do
    it 'sends an email after record creation' do
      expect(mail.class.name).to eq('ActionMailer::Parameterized::MessageDelivery')
    end
  end
end

class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_sent.subject
  #
  def message_sent
    @from_user = params[:from_user]
    @to_user = params[:to_user]
    @message = params[:message]
    @title = params[:title]

    mail(
      from: @from_user,
      to: @to_user, 
      subject: @title
    )
  end
end

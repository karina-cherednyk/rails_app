# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/message_sent
  def message_sent
    MessageMailer.with(from_user: User.first, to_user: User.first, message: "Hello", title: "Message title").message_sent
  end

end

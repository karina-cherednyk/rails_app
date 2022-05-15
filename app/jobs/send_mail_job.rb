class SendMailJob < ApplicationJob
  queue_as :default

  def perform(data, book_id)
    @book = Book.find(book_id)
    @to_user = User.find(@book.user_id)
    MessageMailer.with(
      from_user: current_user.email, 
      to_user: @to_user.email, 
      title: data[:title],
      message: ddata[:message]
      ).message_sent.deliver_now
  end
end

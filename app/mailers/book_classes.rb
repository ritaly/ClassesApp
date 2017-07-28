class BookClasses < ActionMailer::Base
  default from: "usertestrails@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.book_classes.received.subject
  #
  def received(order)
    @order = order
    mail to: @order.email, subject: "Plan zajęć"
  end
end

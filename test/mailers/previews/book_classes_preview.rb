# Preview all emails at http://localhost:3000/rails/mailers/book_classes
class BookClassesPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/book_classes/received
  def received
    BookClasses.received
  end

end

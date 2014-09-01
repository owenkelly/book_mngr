class UserMailer < ActionMailer::Base
  default from: "Do-Not-Reply@owens-book-mngr.com"

  def new_rating_email review
  	@reviewer = review.user
  	@user = review.book.user
  	@book = review.book
  	@review = review
  	mail(to: @user.email, subject: "New review for #{@book.title}!")
  end


end

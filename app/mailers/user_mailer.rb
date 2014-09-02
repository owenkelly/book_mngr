class UserMailer < ActionMailer::Base
  default from: "Do-Not-Reply@owens-book-mngr.com"
  default to: "Do-Not-Reply@owens-book-mngr.com"

  def new_rating_email review
  	@reviewer = review.user
  	@followers = review.book.follower_list
  	@book = review.book
  	@review = review
  	mail(bcc: @followers, subject: "New review for #{@book.title}!")
  end


end

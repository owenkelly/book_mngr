 class UserMailer < ActionMailer::Base
    default from: "owen@owens-book-mngr.com"

  def new_rating_and_review_email review
  	@reviewer = review.user
  	@book = review.book
  	@recipients = Following.recipients(@book, "rating_and_review").map {|d| d.follower.email}
  	@review = review
  	mail(to: @recipients, subject: "New rating and review for #{@book.title}!")
  end


  def new_rating_email review
  	@reviewer = review.user
  	@book = review.book
  	@recipients = Following.recipients(@book, "rating").map {|d| d.follower.email}
  	@review = review
  	mail(to: @recipients, subject: "New rating for #{@book.title}!")
  end

  def new_review_email review
  	@reviewer = review.user
  	@book = review.book
  	@recipients = Following.recipients(@book, "review").map {|d| d.follower.email}
  	@review = review
  	mail(to: @recipients, subject: "New review for #{@book.title}!")
  end

end


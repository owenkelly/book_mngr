class Following < ActiveRecord::Base


	belongs_to :follower, class_name: "User", foreign_key: "user_id"
	belongs_to :follows, class_name: "Book", foreign_key: "book_id"

	validates :book_id, presence: :true
	validates :user_id, presence: :true


	scope :recipients, -> (book, query) { where(book_id: book.id).where(setting: query) }


end


class User < ActiveRecord::Base
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_many :reviews


	def rating
    self.reviews.average(:rating)
  end

  def number_of_reviews
  	self.reviews.count
  end

  def number_of_books
    self.books.count
  end

  def restrict!
    self.add_role(:restricted) unless self.has_role? :admin
  end

  def unrestrict!
    self.remove_role(:restricted)
  end

  def adminize!
    self.add_role(:admin) unless self.has_role? :restricted
  end



end

class User < ActiveRecord::Base
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :books
   has_many :review

	def average_rating
    	review.average(:rating)
    end

    def number_of_reviews
    	review.count
    end

end

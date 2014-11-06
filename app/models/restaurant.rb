class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true
  belongs_to :user

  def has_review(user)
    reviews.find_by(user: user)
  end

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end

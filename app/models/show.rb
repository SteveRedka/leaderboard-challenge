class Show < ActiveRecord::Base
  has_many :reviews

  def average_score
    reviews.inject(0.0) { |sum, review| sum + review.score }.to_f /
      reviews.count
  end
end

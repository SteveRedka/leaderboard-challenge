module Shows
  class OrderedByAverageReviewsScoreQuery
  # Returns query object of shows
  # Ordered by average score
  # Has extra fields:
  # avg_score
  # reviews_count
    def initialize(relation: Show.all, limit: 10)
      @relation = relation
      @limit = limit
    end

    def call
      @relation.joins(:reviews)
               .select('shows.*, AVG(reviews.score) as avg_score,
                        COUNT(reviews.id) as reviews_count')
               .group('shows.id')
               .order('avg(reviews.score) DESC')
               .limit(@limit)
    end
  end
end

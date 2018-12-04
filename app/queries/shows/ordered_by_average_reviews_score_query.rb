module Shows
  class OrderedByAverageReviewsScoreQuery
  # Returns query object of shows
  # Ordered by average score
  # Has extra fields:
  # avg_score - returns average score + random number between 0 and 100, unless
  #   randomized is set to false
  # reviews_count
    def initialize(relation: Show.all, limit: 10, randomized: true)
      @relation = relation
      @limit = limit
      @randomized = randomized
    end

    def call
      @relation.joins(:reviews)
               .select("shows.*,
                        (AVG(reviews.score) + (substr(#{seeded_map_of_digits}, shows.id % 100, 2))) as avg_score,
                        COUNT(reviews.id) as reviews_count")
               .group('shows.id')
               .order('avg_score DESC')
               .limit(@limit)
    end

    private

    def seeded_map_of_digits
      return 0 unless @randomized
      srand(Time.now.min)
      salt = rand(10**102)
    end
  end
end

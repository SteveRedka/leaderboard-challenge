class ShowsController < ApplicationController
  def index
    @shows = Shows::OrderedByAverageReviewsScoreQuery.new.call
  end
end

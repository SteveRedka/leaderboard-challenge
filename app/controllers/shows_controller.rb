class ShowsController < ApplicationController
  protect_from_forgery except: :refresh_results
  respond_to :js
  def index
    @shows = Shows::OrderedByAverageReviewsScoreQuery.new.call
  end

  def refresh_results
    execution_end = Time.now + 1.5
    @shows = Shows::OrderedByAverageReviewsScoreQuery.new.call.shuffle
    sleep execution_end - Time.now

    respond_to do |format|
      format.js { render 'refresh_results' }
    end
  end
end

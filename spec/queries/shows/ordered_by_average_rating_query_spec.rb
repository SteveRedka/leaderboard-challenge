# frozen_string_literal: true

require 'rails_helper'

describe Shows::OrderedByAverageReviewsScoreQuery do
  subject(:shows) { Shows::OrderedByAverageReviewsScoreQuery.new.call }

  describe 'query' do
    before do
      10.times do |i|
        low_rated_show = create :show, title: "low rated show #{i}"
        create :review, show: low_rated_show, score: (10 + rand(10))
      end

      10.times do |i|
        high_rated_show = create :show, title: "high rated show #{i}"
        create :review, show: high_rated_show, score: (70 + rand(10))
      end
    end

    it 'has avg_score column' do
      expect(shows[0]).to respond_to(:avg_score)
    end

    it 'returns top 10 entries' do
      titles = shows.map(&:title)
      expect(titles.length).to eq 10
      titles.each do |title|
        expect(title).not_to match(/low rated show \d+/)
      end
    end
  end
end

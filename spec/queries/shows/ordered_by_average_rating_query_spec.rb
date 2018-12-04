# frozen_string_literal: true

require 'rails_helper'

describe Shows::OrderedByAverageReviewsScoreQuery do
  include ActiveSupport::Testing::TimeHelpers
  subject(:query) { Shows::OrderedByAverageReviewsScoreQuery.new }

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
      expect(query.call[0]).to respond_to(:avg_score)
    end

    it 'has reviews_count column' do
      expect(query.call[0]).to respond_to(:reviews_count)
    end

    context 'randomized' do
      it 'randomly changes value each minute' do
        point_1 = Time.new(2004, 11, 24, 01, 04, 00)
        point_2 = Time.new(2004, 11, 24, 01, 05, 00)

        travel_to point_1 do
          @old_scores = query.call.map(&:avg_score)
        end
        travel_to point_2 do
          @new_scores = query.call.map(&:avg_score)
        end

        expect(@old_scores).not_to eq @new_scores

        travel_to point_1 do
          expect(query.call.map(&:avg_score)).to eq @old_scores
        end
        travel_to point_2 do
          expect(query.call.map(&:avg_score)).to eq @new_scores
        end
      end
    end

    context 'not randomized' do
      subject(:query) do
        Shows::OrderedByAverageReviewsScoreQuery.new(randomized: false)
      end

      it 'returns top 10 entries' do
        titles = query.call.map(&:title)
        expect(titles.length).to eq 10
        titles.each do |title|
          expect(title).not_to match(/low rated show \d+/)
        end
      end
    end
  end
end

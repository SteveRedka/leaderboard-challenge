require 'rails_helper'

describe Show, type: :model do
  let!(:show) { create :show }

  describe '#average_score' do
    it 'returns average score' do
      create :review, show: show, score: 50
      create :review, show: show, score: 100
      expect(show.average_score).to eq 75
    end
  end
end

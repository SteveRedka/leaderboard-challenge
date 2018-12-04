require 'rails_helper'

RSpec.describe "Shows", type: :request do
  let!(:show) { create :show, :with_reviews }
  let!(:second_show) { create :show, :with_reviews }

  describe 'GET /' do
    it 'returns all the required fields' do
      get '/'
      [show, second_show].each do |show|
        expect(response.body).to include(show.title)
        expect(response.body).to include(show.reviews.count.to_s)
      end
    end
  end
end

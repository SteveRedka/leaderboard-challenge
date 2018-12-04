# require 'rails_helper'

# RSpec.feature "Shows", type: :feature do
#   let!(:show) { create :show, :with_reviews }
#   let!(:second_show) { create :show, :with_reviews }

#   describe 'Visit main page' do
#     it 'returns all the required fields' do
#       visit '/'
#       byebug
#       [show, second_show].each do |show|
#         expect(response.body).to include(show.title)
#         expect(response.body).to include(show.average_score)
#         expect(response.body).to include(show.ratings.count)
#       end
#     end
#   end
# end

class PostComment < ApplicationRecord
  belongs_to :player
  belongs_to :post
end

class Post < ApplicationRecord
  has_one_attached :video
  has_one_attached :image
  
  belongs_to :player
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
 
  validates :title, presence: true
  validates :about, presence: true
  
  
   def favorited_by?(player)
    favorites.exists?(player_id: player.id)
   end
 
end

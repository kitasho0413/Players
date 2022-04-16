class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  belongs_to :sport
  has_many :posts

  def self.looks(search, word)
    if search == "perfect_match"
      if Rails.env.production?
        @player = Player.where(["first_name LIKE? OR last_name LIKE? OR concat(first_name,last_name) LIKE? OR team_name LIKE? OR area LIKE?","#{word}","#{word}","#{word}","#{word}","#{word}"])
        # for mysql
      else
        @player = Player.where("first_name || last_name LIKE'#{word}'")
        # for sqlite3
      end

    elsif search == "forward_match"
      @player = Player.where(["first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?","#{word}","#{word}","#{word}","#{word}"])
    elsif search == "backward_match"
      @player = Player.where(["first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?","#{word}","#{word}","#{word}","#{word}"])
    elsif search == "partial_match"
      @player = Player.where(["first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?","#{word}","#{word}","#{word}","#{word}"])
    else
      @player = Player.all
    end
  end
  def full_name
    self.last_name + self.first_name
  end

end

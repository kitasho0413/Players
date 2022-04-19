class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  belongs_to :sport
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
    # フォローしたときの処理
  def follow(player_id)
    relationships.create(followed_id: player_id)
  end
  # フォローを外すときの処理
  def unfollow(player_id)
    relationships.find_by(followed_id: player_id).destroy
  end
  # フォローしているか判定
  def following?(player)
    followings.include?(player)
  end


  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      if Rails.env.production?
        @player = Player.where(["first_name LIKE? OR last_name LIKE? OR concat(first_name,last_name) LIKE? OR team_name LIKE? OR area LIKE?","#{word}","#{word}","#{word}","#{word}","#{word}"])
        # for mysql
      else
        @player = Player.where("first_name || last_name LIKE? OR first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?", "#{word}","#{word}","#{word}","#{word}","#{word}")
        # for sqlite3
      end

    elsif search == "forward_match"
      @player = Player.where(["first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?","#{word}%","#{word}%","#{word}%","#{word}%"])
    elsif search == "backward_match"
      @player = Player.where(["first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?","%#{word}","%#{word}","%#{word}","%#{word}"])
    elsif search == "partial_match"
      @player = Player.where(["first_name LIKE? OR last_name LIKE? OR team_name LIKE? OR area LIKE?","%#{word}%","%#{word}%","%#{word}%","%#{word}%"])
    else
      @player = Player.all
    end
  end
  def full_name
    self.last_name + self.first_name
  end
  
 

end

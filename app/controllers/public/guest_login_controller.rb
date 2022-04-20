class Public::GuestLoginController < ApplicationController
  def guest_sign_in
    player = Player.find_or_create_by!(email: 'guest@example.com') do |player|
      player.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in player
    redirect_to top_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end

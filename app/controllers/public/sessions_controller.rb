# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :player_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected
  # 退会しているかを判断するメソッド
  def player_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @player = Player.find_by(email: params[:player][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@player
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @player.valid_password?(params[:player][:password])
      ## 【処理内容3】
      if @player.is_deleted == true
        redirect_to new_player_registration_path
      end
    end
  end
end


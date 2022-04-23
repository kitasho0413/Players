class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

  def autheniticate_player
    if @current_player==nil
      flash[:notice]="ログインが必要です"
      redirect_to new_player_session_path
    end
  end

  def after_sign_in_path_for(resource)
    top_path
  end

  def after_sign_out_path_for(resource)
    top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :sport_id])
  end

end

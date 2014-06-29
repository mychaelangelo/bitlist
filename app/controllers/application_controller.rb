class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  # Overwriting redirect page after signing in
  def after_sign_in_path_for(resource)
    todos_path(current_user)
  end

  # to ensure user provided all necessary info before accessing specific resources
  def ensure_signup_complete
    # Ensure don't go into infinite loop
    return if action_name == 'finish_signup'

    # redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end

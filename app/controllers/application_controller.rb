class ApplicationController < ActionController::Base
    before_action :set_notifications, if: :current_psuser
    before_action :configure_permitted_parameters, if: :devise_controller?
 protected
 def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :age, :position, :resume, :avatar])
 devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :age, :position, :resume, :avatar])
 end


 def authorize_request(kind = nil)
     unless kind.include?(current_psuser.role)
         redirect_to psposts_path, notice: "No estás autorizado para realizar esta acción"
     end
 end

 def after_sign_in_path_for(resource)
    psposts_path
 end

 private

 def set_notifications
    notifications = Notification.where(recipient: current_psuser).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read

 end

end

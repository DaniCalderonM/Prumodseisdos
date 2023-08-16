# To deliver this notification:
#
# ApplyNotification.with(post: @post).deliver_later(current_user)
# ApplyNotification.with(post: @post).deliver(current_user)

class ApplyNotification < Noticed::Base
  # Add your delivery methods
  #
   deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @pspost = Pspost.find(params[:apply][:pspost_id])
    @apply = Apply.find(params[:apply][:id])
    @psuser = Psuser.find(@apply.psuser_id)
    "#{@psuser.name} aplico a #{@pspost.title}"
  end
  
  def url
    pspost_path(Pspost.find(params[:apply][:pspost_id]))
  end
end

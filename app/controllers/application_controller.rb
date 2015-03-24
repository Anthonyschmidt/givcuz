class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def home

    @deals = Deal.all

    #For now we use only one
    @deal = @deals.first
    @product = @deal.product
    @price = @product.price * @deal.per_business
    @discount = (@deal.per_business * 100).to_i
    @npo = (@deal.per_npo * 100).to_i

    # featured deals to show at the bottom of the page
    @featured_deals = Deal.where("featured = 1").shuffle.take(3)

  end

  def contact
  end

  # send contact information email
  def send_contact_information
    unless params[:email].nil?
      Notifier.send_contact_info(params[:email], params[:message])
      redirect_to "/"
    end
  end

  def after_sign_in_path_for(resource)
    user_email = params[:user][:email]
    user = User.where(:email => user_email).first
    if user.user_type == User::USER_ADMIN
      '/admin'
    elsif user.user_type == User::USER_DONOR 
      '/products/deals'
    else
      super
    end
  end

end

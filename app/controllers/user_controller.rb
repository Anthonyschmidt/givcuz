require 'digest/md5'

class UserController < ApplicationController

  def new_donor

    Npo.all.each do |npo|
      if (params[:npo_code] == Digest::MD5.hexdigest("new_npo_" + npo.id.to_s))
        @npo = npo
        break
      end
    end

    if params.has_key?(:email)

      # donor creation
      donor = User.create(:user_type => User::USER_DONOR, :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
      response = Hash.new
      
      # page redirect with status
      if donor.nil?
        response["success"] = false
        response["message"] = 'Change a few things up and try submitting again.'
      elsif (!donor.errors.empty?)
        response["success"] = false
        response["message"] = donor.errors.full_messages
      else
        # bind npo with the current image object
        donor.npo = @npo
        donor.save!

        #Not in the requirements
        Notifier.new_donor_registration(params[:email])

        response["success"] = true
      end
      render :json => response

    else
      @npo_code = params[:npo_code]
    end

  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
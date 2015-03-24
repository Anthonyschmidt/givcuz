require "prawn"
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/prawn_outputter'

class DealsController < ActionController::Base

	def checkout
		@deal = Deal.where(:id => params[:id_deal]).first
		@product = @deal.product
		@amount = ((@product.price - (@product.price * @deal.discount)) * 100).to_i
	end

	def buy
		@product = Product.where(:id => params[:id]).first
	end

	def auth
		# @product = Product.where(:id => params[:id]).first
	end

	def confirm

		# stripe information
		stripe_token = params[:stripeToken]
		stripe_token_type = params[:stripeTokenType]
		stripe_email = params[:stripeEmail]
		amount = params[:amount]

		# save the current mail in session
		session[:to_email_address] = stripe_email

		customer = Stripe::Customer.create(
			:email => stripe_email,
			:card  => stripe_token
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => amount,
			:description => 'Daily Deal Confirmation',
			:currency    => 'usd'
		)

		@deal = Deal.where(:id => params[:deal_id]).first
		@product = @deal.product

		coupon_params = {
		  "purchase_date" => Date.today.to_s,
	      "is_expired" => 0,
	      "is_used" => 0,
	      "cost" => @deal.discount,
	      "deal_id" => @deal.id,
	      "user_id" => 1,
	      "uid" => build_hash_code
	    }

	    @coupon = Coupon.new(coupon_params)

	   	response = Hash.new
	    if @coupon.nil?
	      response["success"] = false
	      redirect_to "/"
	    else
	      @coupon.save
	      response["success"] = true
	      response["id_coupon"] = @coupon.id
	      redirect_to "/deals/complete/" + @coupon.id.to_s
	    end

	    rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to "/"
	end

	def complete

		@coupon = Coupon.where(:id => params[:id_coupon]).first
		@deal = @coupon.deal
		@product = @deal.product

		# send coupon to user mail
		pdf = PdfHelper.build_coupon(@coupon, @deal, @product, "#{Rails.root}/app/assets/images/")

		# get the current email address to send the coupon
		to_email = session[:to_email_address]

		# if there's a valid email, send the coupon notification
		unless to_email.nil?
			Notifier.send_coupon(to_email, @coupon, pdf)
		end

	end

	def pdf_download

		# get current coupon, deal and product
		coupon = Coupon.where(:id => params[:id_coupon]).first
		deal = coupon.deal
		product = deal.product

		# barcode and pdf creation
		unless coupon.nil? || deal.nil? || product.nil?

			# build pdf object
			pdf = PdfHelper.build_coupon(coupon, deal, product, "#{Rails.root}/app/assets/images/")

			# send pdf to download
			send_data pdf.render, :filename => "coupon.pdf", :type => "application/pdf"
		end

	end

	# build employee hash code
	def build_hash_code
		SecureRandom.hex(8) + (Time.now.to_f * 1000).to_i.to_s
	end
end

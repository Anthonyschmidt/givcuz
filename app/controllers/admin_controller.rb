require 'digest/md5'

class AdminController < ActionController::Base

  before_filter :is_admin?

  TYPE_BUSINESS = "business"
  TYPE_NPO = "npo"
  TYPE_PRODUCT = "product"

  def dashboard
    if (user_signed_in?)
      if (current_user.user_type == User::USER_BUSINESS_MANAGER)
        @business = Business.where(:id => current_user.business_id).first
      elsif (current_user.user_type == User::USER_NPO_MANAGER)
        @npo = Npo.where(:id => current_user.npo_id).first
        @npo_code = Digest::MD5.hexdigest("new_npo_" + @npo.id.to_s)
      end
    end
  end

  def report_dummy
  end

  def edit_business
    @url = "/admin/edit_business/" + params[:business_id]
    @business = Business.find(params[:business_id])
    if params.has_key?(:name)

      # update the business fields
      @business.name = params[:name]
      @business.address = params[:address]
      @business.phone = params[:phone]
      @business.email = params[:email]
      @business.web = params[:web]

      if (!params[:photo].nil?)
        # get the image object after upload
        image_business = create_and_upload_image_object(params, TYPE_BUSINESS)

        # add image to the current business
        @business.images << image_business
      end

      @business.save!

      # redirect to business list
      redirect_to "/admin/businesses?status=success"

    end
  end

  def delete_category
    response = Hash.new
    @category = Category.find(params[:category_id])
    if @category.id
      # delete business
      @category.status = false

      # delete products for that business
      @products = Product.where(:category_id => @category.id)
      @products.all do |product|

        # delete deals for that product
        @deals = Deal.where(:product_id => product.id)
        @deals.all do |deal|
          deal.status = false
          deal.save!
        end
        product.status = false
        product.save!
      end

      @category.save!
      response[:error] = false
      render :json => response

    end
  end

  def delete_npo
    response = Hash.new
    @npo = Category.find(params[:npo_id])
    if @npo.id
      # delete business
      @npo.status = 0

        # delete deals for that product
        @deals = Deal.where(:npo_id => @npo.id)
        @deals.all do |deal|
          deal.status = false
          deal.save!
        end

      @npo.save!
      response[:error] = false
      render :json => response

    end
  end

  def delete_business
    response = Hash.new
    @business = Business.find(params[:business_id])
    if @business.id
      # delete business
      @business.status = false

      # delete products for that business
      @products = Product.where(:business_id => @business.id)
      @products.all do |product|

        # delete deals for that product
        @deals = Deal.where(:product_id => product.id)
        @deals.all do |deal|
          deal.status = false
          deal.save!
        end
        product.status = false
        product.save!
      end

      @business.save!
      response[:error] = false
      render :json => response

    end
  end

  def delete_product
    response = Hash.new
    @product = Product.find(params[:product_id])
    if @product.id
      # delete deals for that product
      @deals = Deal.where(:product_id => @product.id)
      @deals.all do |deal|
        deal.status = false
        deal.save!
      end
      @product.status = false
      @product.save!
    
      response[:error] = false
      render :json => response

    end
  end

  def delete_deal
    response = Hash.new
    
    @deal = Deal.find(params[:deal_id])
    if @deal.id
      
      @deal.status = false
      @deal.save!

      response[:error] = false
      render :json => response
    end
  end

  def new_business
    @url = "/admin/new_business"
    if params.has_key?(:name)

      # get the image object after upload
      image_business = create_and_upload_image_object(params, TYPE_BUSINESS)

      # business parameters to create the object in the db
      business_params = {
        "name" => params[:name],
        "address" => params[:address],
        "phone" => params[:phone],
        "email" => params[:email],
        "web" => params[:web]
      }

      # business creation
      @business = Business.new(business_params)

      # page redirect with status
      if @business.nil?
        redirect_to "/admin/businesses?status=error"
      else

        # add image to the current business
        @business.images << image_business
        @business.save!

        redirect_to "/admin/businesses?status=success"
      end
    end
  end

  def edit_product
    @url = "/admin/edit_product/" + params[:product_id]
    @product = Product.find(params[:product_id])
    @categories = Category.all
    @businesses = Business.all
    if params.has_key?(:name)

      # updating the product attributes
      @product_category = Category.where(:id => params[:category]).first
      @product_business = Business.where(:id => params[:business]).first
      @product.name = params[:name]
      @product.description = params[:description]
      @product.price = params[:price]
      @product.code = params[:code]
      @product.category = @product_category
      @product.business = @product_business

      if (!params[:photo].nil?)
        #get the image object after upload
        image_product = create_and_upload_image_object(params, TYPE_PRODUCT)

        # add image to the current business
        @product.images << image_product
      end
      @product.save!

      # page redirect with status
      redirect_to "/admin/products?status=success"
    end
  end

  def new_product
    @url = "/admin/new_product"
    @categories = Category.all
    @businesses = Business.all
    if params.has_key?(:name)
      @product_category = Category.where(:id => params[:category]).first
      @product_business = Business.where(:id => params[:business]).first

      # get the image object after upload
      image_product = create_and_upload_image_object(params, TYPE_PRODUCT)

      # object parames to create the product in the db
      product_params = {
        "name" => params[:name],
        "description" => params[:description],
        "price" => params[:price],
        "code" => params[:code]
      }

      # create the product
      @product = Product.new(product_params)

      # page redirect with status
      if @product.nil?
        redirect_to "/admin/products?status=error"
      else

        # bind the category, business and image to the product
        @product.category = @product_category
        @product.business = @product_business
        @product.images << image_product
        @product.save!

        redirect_to "/admin/products?status=success"
      end
    end
  end

  def edit_category
    @category = Category.find(params[:category_id])
    if params.has_key?(:name)
      @category.name = params[:name]
      response = Hash.new
      if @category.nil?
        response["success"] = false
      else
        @category.save!
        response["success"] = true
      end
      render :json => response
    end
  end

  def new_category
    if params.has_key?(:name)
      category = Category.new("name" => params[:name])
      response = Hash.new
      if category.nil?
        response["success"] = false
      else
        category.save!
        response["success"] = true
      end
      render :json => response
    end
  end

  def edit_deal
    @deal = Deal.find(params[:deal_id])
    @businesses = Business.all
    @products = Product.all
    @npos = Npo.all
    if params.has_key?(:from)
      npo = Npo.find(params[:npo_id])
      product = Product.find(params[:product_id])

      @deal.from = params[:from]
      @deal.to = params[:to]
      @deal.discount = (params[:discount].to_f / 100)
      @deal.per_business = (params[:per_business].to_f / 100)
      @deal.per_npo = (params[:per_npo].to_f / 100)
      @deal.per_givcuz = (params[:per_givcuz].to_f / 100)
      @deal.featured = ((params[:featured] == "true") ? true : false)
      @deal.active = true
      @deal.is_daily_deal = ((params[:is_daily_deal] == "true") ? true :false)
      @deal.coupon_expires_after_days = params[:coupon_expires_after_days]
      @deal.max_coupons_offered = params[:max_coupons_offered]
      @deal.max_coupons_per_user = params[:max_coupons_per_user]
      @deal.external_cupon_code = params[:external_cupon_code]
      @deal.link_external_code = params[:link_external_code]
      @deal.product_id = params[:product_id]
      @deal.npo_id = params[:npo_id]

      @deal.product = product
      @deal.npo = npo

      response = Hash.new
      if @deal.nil?
        response["success"] = false
      else
        @deal.save!
        response["success"] = true
      end
      render :json => response

    end
  end

  def new_deal
    @businesses = Business.all
    @products = Product.all
    @npos = Npo.all
    if params.has_key?(:from)
      npo = Npo.find(params[:npo_id])
      product = Product.find(params[:product_id])
      deal_params = {
        "from" => params[:from],
        "to" => params[:to],
        "discount" => (params[:discount].to_f / 100),
        "per_business" => (params[:per_business].to_f / 100),
        "per_npo" => (params[:per_npo].to_f / 100),
        "per_givcuz" => (params[:per_givcuz].to_f / 100),
        "featured" => ((params[:featured] == "true") ? true : false),
        "active" => true, # always active?
        "is_daily_deal" => ((params[:is_daily_deal] == "true") ? true : false),
        "coupon_expires_after_days" => params[:coupon_expires_after_days],
        "max_coupons_offered" => params[:max_coupons_offered],
        "max_coupons_per_user" => params[:max_coupons_per_user],
        "external_cupon_code" => params[:external_cupon_code],
        "link_external_code" => params[:link_external_code],
        "product_id" => product.id,
        "npo_id" => npo.id,
        "status" => true
      }
      deal = Deal.create(deal_params)
      deal.product = product
      deal.npo = npo
      response = Hash.new
      if deal.nil?
        response["success"] = false
      else
        deal.save!
        response["success"] = true
      end
      render :json => response
    end
  end

  def edit_npo
    @url = "/admin/edit_npo/" + params[:npo_id]
    @npo = Npo.find(params[:npo_id])

    if params.has_key?(:name)

      @npo.name = params[:name]
      @npo.address = params[:address]
      @npo.phone = params[:phone]
      @npo.email = params[:email]
      @npo.web = params[:web]

      if (!params[:photo].nil?)
        # get the image object after upload
        image_npo = create_and_upload_image_object(params, TYPE_NPO)

        # add image to the current npo
        @npo.images << image_npo
      end
      @npo.save!

      # redirect to npos list
      redirect_to "/admin/npos?status=success"

    end
  end

  def new_npo
    @url = "/admin/new_npo"

    if params.has_key?(:name)

      # get the image object after upload
      image_npo = create_and_upload_image_object(params, TYPE_NPO)

      # npo create parameters
      npo_params = {
        "name" => params[:name],
        "address" => params[:address],
        "phone" => params[:phone],
        "email" => params[:email],
        "web" => params[:web]
      }

      # npo creation
      npo = Npo.create(npo_params)

      # page redirect with status
      if npo.nil?
        redirect_to "/admin/npos?status=error"
      else

        # bind npo with the current image object
        npo.images << image_npo
        npo.save!

        redirect_to "/admin/npos?status=success"
      end

    end
  end

  def edit_user
    @user = User.find(params[:user_id])
    response = Hash.new
    if params.has_key?(:current_password)
      if ((!params[:current_password].empty?) && (!@user.valid_password?(params[:current_password])))
        response["success"] = false
        response["message"] = "The current password is not correct"
      else
        @user.email = params[:email]
        if (!params[:password].empty?)
          @user.password = params[:password]
        end

        if (!@user.errors.empty?)
          response["success"] = false
          response["message"] = @user.errors.full_messages
        else
          begin
            @user.save!
            response["success"] = true
          rescue ActiveRecord::RecordInvalid
            response["success"] = false
            response["message"] = $!.to_s
          end
        end
      end

      render :json => response
    end
  end

  def new_user
    @businesses = Business.all
    @npos = Npo.all
    if params.has_key?(:email)
      user = User.create(:user_type => params[:user_type], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
      response = Hash.new
      if user.nil?
        response["success"] = false
      elsif (!user.errors.empty?)
        response["success"] = false
        response["message"] = user.errors.full_messages
      else
        if params[:user_type] == User::USER_ADMIN
        elsif params[:user_type] == User::USER_DONOR || params[:user_type] == User::USER_NPO_MANAGER
          user.npo = Npo.find(params[:npo_id])
        elsif params[:user_type] == User::USER_BUSINESS_MANAGER
          user.business = Business.find(params[:business_id])
        end
        user.save!
        response["success"] = true
      end
      render :json => response
    end
  end

  def new_donor(npo_id)
    
  end

  def list_users
    @users = User.all
  end

  def list_businesses
    @businesses = Business.where(:status => true).all
  end

  def list_products
    @products = Product.where(:status => true).all
  end

  def list_categories
    @categories = Category.where(:status => true).all
  end

  def list_deals
    @deals = Deal.where(:status => true).all
  end

  def list_npos
    @npos = Npo.where(:status => true).all
  end

  def create_and_upload_image_object(params, type)

      # build image name
      image_name = params[:name] + File.extname(params[:photo].original_filename)

      # upload the image and get the url
      image_url = upload_image(image_name, params[:photo].tempfile, type)

      # create the image object in the db
      image_npo = Image.create(url: image_url)

      # return the image object
      return image_npo

  end

  def upload_image(image_name, image_file, type)

    # get an instance of the S3 interface using
    s3 = AWS::S3.new(
      :access_key_id =>  Rails.configuration.s3[:access_key_id],
      :secret_access_key => Rails.configuration.s3[:secret_access_key]
    )

    # get amazon images bucket
    bucket = s3.buckets[Rails.configuration.s3[:image_bucket]]

    # get image subfolder
    subfolder = ""
    if (type == TYPE_BUSINESS)
      subfolder = Rails.configuration.s3[:image_bucket_business]
    elsif (type == TYPE_NPO)
      subfolder = Rails.configuration.s3[:image_bucket_npo]
    elsif (type == TYPE_PRODUCT)
      subfolder = Rails.configuration.s3[:image_bucket_product]
    end

    object = bucket.objects[subfolder + image_name]
    object.write(:file => image_file)

    # return the public url for the current npo image
    # return object.url_for(:read).to_s
    return object.public_url.to_s

  end

  def is_admin?
    # authenticate_or_request_with_http_basic('Administration') do |username, password|
    #   username == 'superadmin' && password == 't4rm4c1234!'
    # end
    #if !user_signed_in?
    #  render status: :forbidden, text: "You do not have access to this page."
    #end
  end

end

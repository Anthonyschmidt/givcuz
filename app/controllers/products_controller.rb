class ProductsController < ActionController::Base

  def detail
    @deal = Deal.where(:id => params[:id]).first
    @product = @deal.product
    @final_price = '%.2f' % (@product.price - (@product.price * @deal.discount))
    @base_price = '%.2f' % (@product.price)
    @discount = (@deal.discount * 100).to_i
    @npo = (@deal.per_npo * 100).to_i
  end

  # get all the daily deals to show on the view
  def daily_deals

    # all categories from the database
    @categories = Category.all

    # daily deals grouped by product category
    if ((current_user.user_type == User::USER_DONOR) && (current_user.npo_id))
      @daily_deals_by_category = Deal.where(:is_daily_deal => 1, :npo_id => current_user.npo_id).group_by{ |d| d.product.category }
    end
  end

  def daily_deals_by_category

    # get the category id from the parameters
    @current_category = Category.find(params[:id_category])

    # all categories from the database
    @categories = Category.all

    # daily deals of one category
    if ((current_user.user_type == User::USER_DONOR) && (current_user.npo_id))
      @daily_deals_by_category = Deal.where(:is_daily_deal => 1, :npo_id => current_user.npo_id).joins(product: :category).where('categories.id' => @current_category.id)
    end
  end

  def deals
    # product deals
    if ((current_user.user_type == User::USER_DONOR) && (current_user.npo_id))
      @deals = Deal.where(:is_daily_deal => 0, :npo_id => current_user.npo_id)
    end
  end

  def deals_by_category

    # get the category id from the parameters
    @current_category = Category.where(:id => params[:id_category].to_i).first

    # daily deals of one category
    if ((current_user.user_type == User::USER_DONOR) && (current_user.npo_id))
      @deals_by_category = Deal.where(:is_daily_deal => 0, :npo_id => current_user.npo_id).joins(product: :category).where("categories.id" => @current_category.id)
    end
  end

end

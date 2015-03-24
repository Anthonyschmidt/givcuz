class AddStatusField < ActiveRecord::Migration
  def change
    add_column :npos, :status, :boolean
    Npo.find_each do |npo|
      npo.status = 1
      npo.save!
    end

    add_column :deals, :status, :boolean
    Deal.find_each do |deal|
      deal.status = 1
      deal.save!
    end

    add_column :products, :status, :boolean
    Product.find_each do |product|
      product.status = 1
      product.save!
    end

    add_column :categories, :status, :boolean
    Category.find_each do |category|
      category.status = 1
      category.save!
    end

    add_column :businesses, :status, :boolean
    Business.find_each do |business|
      business.status = 1
      business.save!
    end
  end

  def down
    remove_column :npos, :status
    remove_column :deals, :status
    remove_column :products, :status
    remove_column :categories, :status
    remove_column :businesses, :status
  end

end

Bootprod::Application.routes.draw do
  devise_for :users
  get "application/home"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#home'

  ################
  # admin routes #
  ################

  get '/admin' => 'admin#dashboard', :as => :dashboard

  # listing routes
  get '/admin/businesses' => 'admin#list_businesses', :as => :list_businesses
  get '/admin/products' => 'admin#list_products', :as => :list_products
  get '/admin/categories' => 'admin#list_categories', :as => :list_categories
  get '/admin/deals' => 'admin#list_deals', :as => :list_deals
  get '/admin/npos' => 'admin#list_npos', :as => :list_npos
  get '/admin/users' => 'admin#list_users', :as => :list_users
  get '/admin/report_dummy/:report_number' => 'admin#report_dummy', :as => :report_dummy

  # creation routes
  get '/admin/new_business' => 'admin#new_business', :as => :new_business
  post '/admin/new_business' => 'admin#new_business', :as => :add_new_business
  get '/admin/new_product' => 'admin#new_product', :as => :new_product
  post '/admin/new_product' => 'admin#new_product', :as => :add_new_product
  get '/admin/new_category' => 'admin#new_category', :as => :new_category
  post '/admin/new_category' => 'admin#new_category', :as => :add_new_category
  get '/admin/new_deal' => 'admin#new_deal', :as => :new_deal
  post '/admin/new_deal' => 'admin#new_deal', :as => :add_new_deal
  get '/admin/new_npo' => 'admin#new_npo', :as => :new_npo
  post '/admin/new_npo' => 'admin#new_npo', :as => :add_new_npo
  get '/admin/new_user' => 'admin#new_user', :as => :new_user
  post '/admin/new_user' => 'admin#new_user', :as => :add_new_user

  # edit routes
  get '/admin/edit_deal/:deal_id' => 'admin#edit_deal', :as => :edit_deal
  post '/admin/edit_deal/:deal_id' => 'admin#edit_deal', :as => :edit_deal_post
  get '/admin/edit_product/:product_id' => 'admin#edit_product', :as => :edit_product
  post '/admin/edit_product/:product_id' => 'admin#edit_product', :as => :edit_product_post
  get '/admin/edit_business/:business_id' => 'admin#edit_business', :as => :edit_business
  post '/admin/edit_business/:business_id' => 'admin#edit_business', :as => :edit_business_post
  get '/admin/edit_category/:category_id' => 'admin#edit_category', :as => :edit_category
  post '/admin/edit_category/:category_id' => 'admin#edit_category', :as => :edit_category_post
  get '/admin/edit_npo/:npo_id' => 'admin#edit_npo', :as => :edit_npo
  post '/admin/edit_npo/:npo_id' => 'admin#edit_npo', :as => :edit_npo_post
  get '/admin/edit_user/:user_id' => 'admin#edit_user', :as => :edit_user
  post '/admin/edit_user/:user_id' => 'admin#edit_user', :as => :edit_user_post

   # delete routes
  get '/admin/delete_deal/:deal_id' => 'admin#delete_deal', :as => :delete_deal
  post '/admin/delete_deal/:deal_id' => 'admin#delete_deal', :as => :delete_deal_post
  get '/admin/delete_product/:product_id' => 'admin#delete_product', :as => :delete_product
  post '/admin/delete_product/:product_id' => 'admin#delete_product', :as => :delete_product_post
  get '/admin/delete_business/:business_id' => 'admin#delete_business', :as => :delete_business
  post '/admin/delete_business/:business_id' => 'admin#delete_business', :as => :delete_business_post
  get '/admin/delete_category/:category_id' => 'admin#delete_category', :as => :delete_category
  post '/admin/delete_category/:category_id' => 'admin#delete_category', :as => :delete_category_post
  get '/admin/delete_npo/:npo_id' => 'admin#delete_npo', :as => :delete_npo
  post '/admin/delete_npo/:npo_id' => 'admin#delete_npo', :as => :delete_npo_post
  get '/admin/delete_user/:user_id' => 'admin#delete_user', :as => :delete_user
  post '/admin/delete_user/:user_id' => 'admin#delete_user', :as => :delete_user_post

  ###############
  # site routes #
  ###############

  # sign up routes
  get '/donor/new_donor/:npo_code' => 'user#new_donor', :as => :new_donor
  post '/donor/new_donor/:npo_code' => 'user#new_donor', :as => :add_new_donor

  get '/about' => 'application#about', :as => :about
  get '/npo' => 'application#npo', :as => :npo
  get '/donor' => 'application#donor', :as => :donor
  get '/business' => 'application#business', :as => :business
  get '/contact' => 'application#contact', :as => :contact
  post '/contact/send_contact_information' => 'application#send_contact_information', :as => :send_contact_information
  get '/products/detail/:id' => 'products#detail', :as => :detail
  get '/products/daily_deals' => 'products#daily_deals', :as => :daily_deals
  get '/products/daily_deals/:id_category' => 'products#daily_deals_by_category', :as => :daily_deals_by_category
  get '/products/deals/:id_category' => 'products#deals_by_category', :as => :deals_by_category
  get '/products/deals' => 'products#deals', :as => :deals
  get '/deals/checkout/:id_deal' => 'deals#checkout', :as => :checkout
  get '/deals/complete/:id_coupon' => 'deals#complete', :as => :complete
  get '/deals/pdf_download/:id_coupon' => 'deals#pdf_download', :as => :pdf_download
  post '/deals/confirm' => 'deals#confirm', :as => :confirm
  post '/deals/buy' => 'deals#buy', :as => :buy
  get '/deals/auth' => 'deals#auth', :as => :auth

end

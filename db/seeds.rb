# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# business
b1 = Business.create(name: 'Froots', address: 'Fort Collins 2287', phone: '1122334455', email: 'business1@business.com', web: 'business1.com', category: 'Food')
b2 = Business.create(name: 'Electronic Land', address: 'S Timberline 181', phone: '5544332211', email: 'business2@business.com', web: 'business2.com', category: 'Electronics')
b3 = Business.create(name: 'Four Square', address: 'Niagara Falls Blvd 119', phone: '1234512345', email: 'business3@business.com', web: 'business3.com', category: 'Misc')

# NPOs
npo1 = Npo.create(name: 'Helping the world', address: 'Pennsylvania Ave. 194', phone: '111111111111', email: 'electroworld@npo.com', web: 'helpingtheworld.com')
npo2 = Npo.create(name: 'Charity Fruits for People', address: 'Evergreen terrace 742', phone: '222222222222', email: 'cfruits@npo.com', web: 'charityfruits.com')

# default ebay categories
c1 = Category.create(name: "Electronics")
c2 = Category.create(name: "Fashion")
c3 = Category.create(name: "Jewelry & Watches")
c4 = Category.create(name: "Health & Beauty")
c5 = Category.create(name: "Home & Garden")
c6 = Category.create(name: "Toys, Baby & Kids")
c7 = Category.create(name: "Sports & Exercise")
c8 = Category.create(name: "Even More Deals")

# pizza product and deal
b = Business.create(name: 'Testing Business', address: 'test address 1234', phone: '111111111', email: 'test@test.com', web: 'test.com', category: 'test')
p = Product.create(name: 'Peperoni Pizza', description: "Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 5, code: nil, business_id: b.id)
d = Deal.create(discount: 0.5, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: p.id, npo_id: npo1.id, active: 1)

# product images
im0 = Image.create(url: "pizza.jpg") # pizza
im1 = Image.create(url: "product1.jpg") # watch
im2 = Image.create(url: "product2.jpg") # cellphone
im3 = Image.create(url: "product3.jpg") # sunglasses
im4 = Image.create(url: "product4.jpg") # redbull
im5 = Image.create(url: "product5.jpg") # xbox joystick
im6 = Image.create(url: "product6.jpg") # headphones
im7 = Image.create(url: "product7.png") # nivea creme
im8 = Image.create(url: "product8.png") # tomato
im9 = Image.create(url: "product9.png") # multimedia player
im10 = Image.create(url: "b1p1.jpg") # fruit batch
im11 = Image.create(url: "b1p2.jpg") # fruit juice
im12 = Image.create(url: "b1p3.jpg") # fruit jar
im13 = Image.create(url: "b1p4.jpg") # fruit holder
im14 = Image.create(url: "b1p5.jpg") # apple holder
im15 = Image.create(url: "b2p1.jpg") # blender
im16 = Image.create(url: "b2p2.jpg") # microwave
im17 = Image.create(url: "b2p3.jpg") # computer
im18 = Image.create(url: "b2p4.jpg") # toaster
im19 = Image.create(url: "b2p5.jpg") # washmachine
im20 = Image.create(url: "b3p1.jpg") # umbrella
im21 = Image.create(url: "b3p2.jpg") # portable desk
im22 = Image.create(url: "b3p3.jpg") # trash can
im23 = Image.create(url: "b3p4.jpg") # flower pot
im24 = Image.create(url: "b3p5.jpg") # tupper

# more products for daily deals
p1 = Product.create(name: 'Steel watch', description: "Amazing steel watch donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 455, code: nil, business_id: b.id)
p2 = Product.create(name: 'Motorola V1145 cellphone', description: "Amazing cellphone to call all your friends dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 155, code: nil, business_id: b.id)
p3 = Product.create(name: 'Sunglasses', description: "Amazing sunglasses to protect your eyes. Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 124, code: nil, business_id: b.id)
p4 = Product.create(name: 'Redbull 6pack', description: "Amazing steel watch donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 42, code: nil, business_id: b.id)
p5 = Product.create(name: 'XBOX Joystick', description: "Micro joystick for xbox 360. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 155, code: nil, business_id: b.id)
p6 = Product.create(name: 'Headphones Panasonic', description: "Incredible sound. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 55, code: nil, business_id: b.id)
p7 = Product.create(name: 'Nivea creme', description: "Great creme for the skin. Ddio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 12, code: nil, business_id: b.id)
p8 = Product.create(name: 'Tomato holder and more', description: "Amazing tomato holder with accesories steel watch donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget ligula porta felis euismod semper.", price: 19, code: nil, business_id: b.id)
p9 = Product.create(name: 'Multimedia player!', description: "Listen to all your music and videos. Amazing steel watch donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id semper.", price: 40, code: nil, business_id: b.id)

# products for business1
b1p1 = Product.create(name: 'Fruit batch', description: "Amazing fruit batch donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 33, code: nil, business_id: b1.id)
b1p2 = Product.create(name: 'Fruit juice', description: "Amazing set of juice with mermelades cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 4, code: nil, business_id: b1.id)
b1p3 = Product.create(name: 'Fruit jar', description: "Cool jar donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 15, code: nil, business_id: b1.id)
b1p4 = Product.create(name: 'Fruit holder', description: "Great holder watch donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 5, code: nil, business_id: b1.id)
b1p5 = Product.create(name: 'Apple holder', description: "Amazing apple holder sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 21, code: nil, business_id: b1.id)

# products for business2
b2p1 = Product.create(name: 'Blender', description: "Amazing blender donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 38, code: nil, business_id: b2.id)
b2p2 = Product.create(name: 'Microwave', description: "Great economic microwave of juice with mermelades cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 45, code: nil, business_id: b2.id)
b2p3 = Product.create(name: 'Notebook Dell v129958.124', description: "Great notebook with dual core, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 315, code: nil, business_id: b2.id)
b2p4 = Product.create(name: 'Toaster', description: "Cool toaster. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 105, code: nil, business_id: b2.id)
b2p5 = Product.create(name: 'Wash machine', description: "Washing machine sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 97, code: nil, business_id: b2.id)

# products for business3
b3p1 = Product.create(name: 'Umbrella', description: "Amazing color umbrella donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 8, code: nil, business_id: b3.id)
b3p2 = Product.create(name: 'Portable desk', description: "Great economic portable desk of juice with mermelades cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 25, code: nil, business_id: b3.id)
b3p3 = Product.create(name: 'Trashcan', description: "Economic trashcan with bluetooth, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 6, code: nil, business_id: b3.id)
b3p4 = Product.create(name: 'Flower pot', description: "Different varieties of potted. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 15, code: nil, business_id: b3.id)
b3p5 = Product.create(name: 'Tupper', description: "Tupperware kitchen. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper.", price: 17, code: nil, business_id: b3.id)

# bind product to categories
p.category = c7
p1.category = c3
p2.category = c1
p3.category = c4
p4.category = c5
p5.category = c1
p6.category = c1
p7.category = c4
p8.category = c5
p9.category = c1
b1p1.category = c5
b1p2.category = c5
b1p3.category = c5
b1p4.category = c5
b1p5.category = c5
b2p1.category = c1
b2p2.category = c1
b2p3.category = c1
b2p4.category = c1
b2p5.category = c1
b3p1.category = c5
b3p2.category = c5
b3p3.category = c5
b3p4.category = c5
b3p5.category = c5

# bind image to products
p.images << im0
p1.images << im1
p2.images << im2
p3.images << im3
p4.images << im4
p5.images << im5
p6.images << im6
p7.images << im7
p8.images << im8
p9.images << im9
b1p1.images << im10
b1p2.images << im11
b1p3.images << im12
b1p4.images << im13
b1p5.images << im14
b2p1.images << im15
b2p2.images << im16
b2p3.images << im17
b2p4.images << im18
b2p5.images << im19
b3p1.images << im20
b3p2.images << im21
b3p3.images << im22
b3p4.images << im23
b3p5.images << im24

# product update in the database
p.save!
p1.save!
p2.save!
p3.save!
p4.save!
p5.save!
p6.save!
p7.save!
p8.save!
p9.save!
b1p1.save!
b1p2.save!
b1p3.save!
b1p4.save!
b1p5.save!
b2p1.save!
b2p2.save!
b2p3.save!
b2p4.save!
b2p5.save!
b3p1.save!
b3p2.save!
b3p3.save!
b3p4.save!
b3p5.save!

# feature deals
fd1 = Deal.create(discount: 0.6, per_business: 0.15, per_npo: 0.1, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p1.id, npo_id: npo2.id, featured: 1, active: 1)
fd2 = Deal.create(discount: 0.6, per_business: 0.15, per_npo: 0.1, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p4.id, npo_id: npo1.id, featured: 1, active: 1)
fd3 = Deal.create(discount: 0.6, per_business: 0.15, per_npo: 0.1, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p5.id, npo_id: npo1.id, featured: 1, active: 1)
fd4 = Deal.create(discount: 0.6, per_business: 0.15, per_npo: 0.1, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p2.id, npo_id: npo1.id, featured: 1, active: 1)
fd5 = Deal.create(discount: 0.6, per_business: 0.15, per_npo: 0.1, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p7.id, npo_id: npo2.id, featured: 1, active: 1)

# daily deals
dd1 = Deal.create(discount: 0.5, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p1.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd2 = Deal.create(discount: 0.35, per_business: 0.35, per_npo: 0.11, per_givcuz: 0.21, max_coupons_per_user: 1, product_id: p2.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd3 = Deal.create(discount: 0.45, per_business: 0.25, per_npo: 0.12, per_givcuz: 0.21, max_coupons_per_user: 1, product_id: p3.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd4 = Deal.create(discount: 0.55, per_business: 0.15, per_npo: 0.13, per_givcuz: 0.21, max_coupons_per_user: 1, product_id: p4.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd5 = Deal.create(discount: 0.65, per_business: 0.35, per_npo: 0.14, per_givcuz: 0.11, max_coupons_per_user: 1, product_id: p5.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd6 = Deal.create(discount: 0.5, per_business: 0.65, per_npo: 0.15, per_givcuz: 0.41, max_coupons_per_user: 1, product_id: p6.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd7 = Deal.create(discount: 0.5, per_business: 0.65, per_npo: 0.16, per_givcuz: 0.31, max_coupons_per_user: 1, product_id: p7.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd8 = Deal.create(discount: 0.1, per_business: 0.45, per_npo: 0.17, per_givcuz: 0.21, max_coupons_per_user: 1, product_id: p8.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)
dd9 = Deal.create(discount: 0.2, per_business: 0.35, per_npo: 0.18, per_givcuz: 0.21, max_coupons_per_user: 1, product_id: p9.id, npo_id: npo1.id, is_daily_deal: 1, active: 1)

# product deals for business
b1d1 = Deal.create(discount: 0.35, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b1p1.id, npo_id: npo2.id, active: 1)
b1d2 = Deal.create(discount: 0.15, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b1p2.id, npo_id: npo2.id, active: 1)
b1d3 = Deal.create(discount: 0.25, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b1p3.id, npo_id: npo2.id, active: 1)
b1d4 = Deal.create(discount: 0.1, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b1p4.id, npo_id: npo2.id, active: 1)
b1d5 = Deal.create(discount: 0.3, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b1p5.id, npo_id: npo2.id, active: 1)
b2d1 = Deal.create(discount: 0.11, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b2p1.id, npo_id: npo1.id, active: 1)
b2d2 = Deal.create(discount: 0.2, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b2p2.id, npo_id: npo1.id, active: 1)
b2d3 = Deal.create(discount: 0.33, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b2p3.id, npo_id: npo1.id, active: 1)
b2d4 = Deal.create(discount: 0.4, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b2p4.id, npo_id: npo1.id, active: 1)
b2d5 = Deal.create(discount: 0.5, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b2p5.id, npo_id: npo1.id, active: 1)
b3d1 = Deal.create(discount: 0.15, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b3p1.id, npo_id: npo1.id, active: 1)
b3d2 = Deal.create(discount: 0.15, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b3p2.id, npo_id: npo1.id, active: 1)
b3d3 = Deal.create(discount: 0.25, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b3p3.id, npo_id: npo1.id, active: 1)
b3d4 = Deal.create(discount: 0.35, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b3p4.id, npo_id: npo1.id, active: 1)
b3d5 = Deal.create(discount: 0.45, per_business: 0.5, per_npo: 0.1, per_givcuz: 0.1, max_coupons_per_user: 1, product_id: b3p5.id, npo_id: npo1.id, active: 1)

# test users
u1 = User.create(user_type: User::USER_ADMIN, username: 'admin', password: 'admin', email: 'admin@admin.com')
u2 = User.create(user_type: User::USER_DONOR, username: 'donor', password: 'donor', email: 'donor@donor.com')
u3 = User.create(user_type: User::USER_BUSINESS_MANAGER, username: 'business_manager', password: 'business_manager', email: 'bs_manager@bs_manager.com', business_id: 1)
u4 = User.create(user_type: User::USER_NPO_MANAGER, username: 'npo_manager', password: 'npo_manager', email: 'npo_manager@npo_manager.com', npo_id: 1)


# business asociation
u3.user_management = b1
u3.save!

# npo manager asociation
u4.user_management = npo1
u4.save!


Rails.configuration.s3 = {
  :access_key_id => ENV["S3_ACCESS_KEY_ID"],
  :secret_access_key => ENV["S3_SECRET_ACCESS_KEY"],
  :image_bucket => 'givcuz-images',
  :image_bucket_test => 'givcuz-images-test',
  :image_bucket_npo => 'npo_images/',
  :image_bucket_business => 'business_images/',
  :image_bucket_product => 'product_images/'
}

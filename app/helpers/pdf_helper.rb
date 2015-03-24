module PdfHelper
	require 'open-uri'

	def self.build_coupon(coupon, deal, product, assets_images_route)

		barcode = Barby::Code128B.new(coupon.uid)
		pdf = Prawn::Document.new

		# page border
		pdf.stroke_bounds

		# product name
		pdf.move_down 15
		pdf.text product.name, :size => 18, :style => :bold, :spacing => 4, :align => :center

		# coupon hash code
		pdf.move_down 5
		pdf.text "Coupon ID: " + coupon.uid, :size => 9, :style => :bold, :spacing => 4, :align => :center

		# coupon date
		now = DateTime.now.strftime('%m/%d/%Y')
		pdf.text "Coupon Date: " + now, :size => 9, :style => :bold, :spacing => 4, :align => :center

		# coupon barcode
		pdf.move_down 5
		barcode.annotate_pdf(pdf, :x => 95, :y => 600)

		# product image
		pdf.move_down 60
		image = (product.images.last.nil?) ? 'default_product.png' : product.images.last.url

		# if it's an external image, open it and add it to the pdf, if not load from assets
		if url?(image)
			pdf.image open(image), :position => :center, :width => 300
		else
			pdf.image assets_images_route + image, :position => :center, :width => 300
		end

		# product description
		pdf.move_down 15
		pdf.text product.description, :align => :center

		# formatted values
		price = '%.2f' % product.price
		price_discount = ((deal.discount * 100).to_i).to_s
		percentage_business = ((deal.per_business * 100).to_i).to_s
		percentage_npo = ((deal.per_npo * 100).to_i).to_s
		percentage_givcuz = ((deal.per_givcuz * 100).to_i).to_s

		# website information
		pdf.move_down 40
		pdf.text I18n.t("coupon.title"), :align => :center
		pdf.text I18n.t("website"), :align => :center

		# page break and page border
		pdf.start_new_page
		pdf.stroke_bounds

		# product name
		pdf.move_down 15
		pdf.text "Additional Information", :size => 18, :style => :bold, :spacing => 4, :align => :center

		# coupon hash code
		pdf.move_down 5
		pdf.text "Coupon ID: " + coupon.uid, :size => 9, :style => :bold, :spacing => 4, :align => :center

		# coupon date
		now = DateTime.now.strftime('%m/%d/%Y')
		pdf.text "Coupon Date: " + now, :size => 9, :style => :bold, :spacing => 4, :align => :center

		# coupon barcode
		pdf.move_down 5
		barcode.annotate_pdf(pdf, :x => 95, :y => 600)

		# deal information
		pdf.move_down 60
		pdf.bounding_box([180, pdf.cursor - 15], :width => 200, :height => 150) do
			pdf.transparent(0.4) { pdf.stroke_bounds }
			pdf.move_down 10
			pdf.text "Your deal", :size => 15, :style => :bold, :spacing => 4, :align => :center
			pdf.move_down 10
			pdf.text "Product price: U$S " + price
			pdf.text "Discount: " + price_discount + "%"
			pdf.text "Percentage business: " + percentage_business + "%"
			pdf.text "Percentage NPO: " + percentage_npo + "%"
			pdf.text "Percentage GivCuz: " + percentage_givcuz + "%"
			pdf.move_down 20
			pdf.text "Total paid: U$S " + '%.2f' % (product.price * deal.discount)
		end

		business = product.business

		# business information
		pdf.bounding_box([180, pdf.cursor - 15], :width => 200, :height => 150) do
			pdf.transparent(0.4) { pdf.stroke_bounds }
			pdf.move_down 10
			pdf.text "Business information", :size => 15, :style => :bold, :spacing => 4, :align => :center
			pdf.move_down 10
			pdf.text "Name: " + business.name
			pdf.text "Address: " + business.address + "%"
			pdf.text "Phone: " + business.phone + "%"
			pdf.text "Email: " + business.email + "%"
			pdf.text "website: " + business.web
		end

		# npo name
		pdf.move_down 20
		pdf.text "Supported organization: " + deal.npo.name, :size => 12, :style => :bold, :spacing => 4, :align => :center

		# website information
		pdf.move_down 50
		pdf.text I18n.t("coupon.title"), :align => :center
		pdf.text I18n.t("website"), :align => :center

		return pdf

	end

	def self.url?(string)
	  uri = URI.parse(string)
	  %w( http https ).include?(uri.scheme)
		rescue URI::BadURIError
	  	false
		rescue URI::InvalidURIError
	  	false
	end


end
class Notifier < ActionMailer::Base

  DEFAULT_EMAIL_ADDRESS_FROM = "eugenia@tarmac.io"
  DEFAULT_EMAIL_ADDRESS_TO = "eugenia@tarmac.io"

  # FIXME: get real text for each email

  # coupon notification
  COUPON_SUBJECT_TEXT = "Congratulations! Your purchased coupon is here."
  COUPON_BODY_TEXT = "Attached is the coupon you purchased from GivCuz.com"

  #Donor Registration
  REGISTRATION_SUBJECT_TEXT = "Welcome to GivCuz."
  REGISTRATION_BODY_TEXT = "Congratulations! You've just signed up on GivCuz, go to http://www.givcuz.com/ to start helping your NPO."

  # contact notification
  CONTACT_SUBJECT_TEXT = "New email contact from "

  def send_coupon(to_email_address, coupon, pdf)
    create_mail(to_email_address, COUPON_SUBJECT_TEXT, COUPON_BODY_TEXT, pdf, coupon)
  end

  def new_donor_registration(to_email_address)
    create_mail(to_email_address, REGISTRATION_SUBJECT_TEXT, REGISTRATION_BODY_TEXT)
  end

  def send_contact_info(contact_email_address, content)

    # recipient list
    to_list = []
    to_list << DEFAULT_EMAIL_ADDRESS_TO

    # add all admins to the recipient list
    admins = User.where(:user_type => User::USER_ADMIN)
    admins.each do |admin|
      unless admin.email.nil?
        to_list << admin.email
      end
    end

    # if there's emails, send the notification
    unless to_list.empty?
      create_mail(to_list, CONTACT_SUBJECT_TEXT + contact_email_address.to_s, content)
    end

  end

  private

  def create_mail(to_email_address, subject, content, pdf = nil, coupon = nil)
    mail = Mail.new do
      from     DEFAULT_EMAIL_ADDRESS_FROM
      to       to_email_address
      subject  subject
      html_part do
        content_type 'text/html; charset=UTF-8'
        body content
      end
      if pdf
        add_file :filename => "coupon#{coupon.uid}.pdf", :content => pdf.render
      end
    end
    mail.deliver!
  end

end


# include MD5 gem, should be part of standard ruby install
# require 'digest/md5'

module GravatarHelpers
  def get_gravatar(email)
    if email.present?
      email_address = email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      image_src = "http://www.gravatar.com/avatar/#{hash}"
    end
  end
end
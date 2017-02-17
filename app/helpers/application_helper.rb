module ApplicationHelper
  def set_stars(rating)
    result = ""
    for i in 1..5
      if i > rating
        result << '<span class="star-icon">☆</span>'
      else
        result << '<span class="star-icon full">☆</span>'
      end
    end
    return result.html_safe
  end

  def gravatar_url(user)
    gravatar = Digest::MD5::hexdigest(user.email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png"
  end

  def avatar_url(user)
    if user.image.present?
      url = user.image
    elsif gravatar?(user)
      gravatar = Digest::MD5::hexdigest(user.email).downcase
      url = "http://gravatar.com/avatar/#{gravatar}.png"
    else
      url = "default.png"
    end
  end

  def gravatar?(user)
    gravatar_check = "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404 # from d=404 parameter
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end

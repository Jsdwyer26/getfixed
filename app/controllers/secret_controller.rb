class SecretController < ApplicationController

  def instagram_photos(hashtag)
    
    ig_tags = HTTParty.get("https://api.instagram.com/v1/tags/" + hashtag + "/media/recent?access_token=3008367581.25c44ea.2ba7a543e20b4b629d98c094e0d33db5")
    # Instagram gem outputs same result.
    ig_gem_tags = Instagram.tag_recent_media(hashtag, {:count => 1})
    #instagram = Instagram.user_recent_media("3008367581", {:count => 1})
    # Example of how to access the response data
    p ig_tags["data"][0]["images"]["standard_resolution"]["url"]
    return ig_tags["data"]
  end

  def index
    #@instagram = Instagram.user_recent_media("2486700", {:count => 8})
    @instagram = Instagram.user_recent_media("3008367581")
    @ig_tags = instagram_photos("fixedgear")
  end
end

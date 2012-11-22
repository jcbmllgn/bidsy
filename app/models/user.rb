class User < ActiveRecord::Base

  # Not sure if we'll need this elsewhere but here it is.
  SINGLY_API_BASE = "https://api.singly.com"

  # The UID is a unique ID that OAuth gives to users. We are storing
  # it as the main means of comparing users. When you login with singly
  # we will get this ID back and be able to get the User accordingly.
  attr_accessible :uid

  # A User has many Posts, these are this users posting, things
  # that he is selling.
  has_many :posts


  # Since we are not storing any of the data for users ourselves
  # we need to go get it on the first request for information.
  #
  # We save the profile to `@profile` to avoid multiple HTTP requests
  # for the profile on one page.
  #
  def get_profile
    @profile = HTTParty.get(SINGLY_API_BASE,
      :query => {:access_token => token}
    ).parsed_response unless @profile
  end

  # ## Profile Accessors
  #
  # These are shortcuts to get information about this
  # user. Things like their name, email, and photo_url.
  #
  def name
    get_profile and @profile["name"]
  end

end

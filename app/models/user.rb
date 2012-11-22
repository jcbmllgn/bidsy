class User < ActiveRecord::Base
  attr_accessible :uid

  def get_profile
    @profile = HTTParty.get("https://api.singly.com/profile",
      :query => {:access_token => token}
    ).parsed_response unless @profile
  end

  def name
    get_profile and @profile["name"]
  end

end

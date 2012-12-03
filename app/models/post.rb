class Post < ActiveRecord::Base
  attr_accessible :user_id,             # the associated user's ID
                  :title,               # title of post, short and sweet
                  :description,         # description of post, shortish
                  :details,             # a serialized hash of details
                  :starting_bid,        # the original bid price
                  :current_bid,         # current bid :P
                  :buyout_price,        # buyout price
                  :delivery_method,     # One Of: local, ship, or both
                  :images_attributes

  # Posts have many Images.
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  # Every post belongs to a user that is selling the item.
  belongs_to :user

  # Posts details are an array of values
  serialize :details, Hash

end
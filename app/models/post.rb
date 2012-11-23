class Post < ActiveRecord::Base
  attr_accessible :user_id,             # the associated user's ID
                  :title,               # title of post, short and sweet
                  :description,         # description of post, shortish
                  :details,             # a serialized hash of details
                  :starting_bid,        # the original bid price
                  :current_bid,         # current bid :P
                  :photo                # paperclip photo

  # paperclip's magic
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

  # Every post belongs to a user that is selling the item.
  belongs_to :user

end

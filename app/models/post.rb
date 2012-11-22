class Post < ActiveRecord::Base
  attr_accessible :user_id,             # the associated user's ID
                  :photo_file_name,     # name of the photo  (@paperclip)
                  :photo_content_type,  # type of photo      (@paperclip)
                  :photo_file_size,     # file size of photo (@paperclip)
                  :title,               # title of post, short and sweet
                  :description,         # description of post, shortish
                  :details,             # a serialized hash of details
                  :starting_bid,        # the original bid price
                  :current_bid          # current bid :P

  # Every post belongs to a user that is selling the item.
  belongs_to :user

end

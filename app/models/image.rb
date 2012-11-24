class Image < ActiveRecord::Base
  attr_accessible :data

  # Theses are images for posts.
  belongs_to :post

  has_attached_file :data,
    styles: {
      medium: "300x300>",
      thumb: "100x100>"
    }
end
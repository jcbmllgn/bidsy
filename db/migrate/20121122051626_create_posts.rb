class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.string :title
      t.text :description
      t.text :details
      t.integer :starting_bid
      t.integer :current_bid
      t.timestamps
    end
  end
end

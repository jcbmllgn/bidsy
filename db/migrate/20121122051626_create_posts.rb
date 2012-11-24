class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :details
      t.integer :starting_bid
      t.integer :current_bid
      t.timestamps
    end
  end
end

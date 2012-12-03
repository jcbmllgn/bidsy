class BuyoutPrice < ActiveRecord::Migration
  def change
    add_column :posts, :buyout_price, :integer
  end
end

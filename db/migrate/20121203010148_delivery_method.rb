class DeliveryMethod < ActiveRecord::Migration
  def change
    add_column :posts, :delivery_method, :string
  end
end

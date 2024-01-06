class UpdateUnitPriceForExistingOrderItems < ActiveRecord::Migration[6.0]
  def up
    OrderItem.find_each do |order_item|
      order_item.update_column(:unit_price, order_item.product.price)
    end
  end

  def down
    # If needed, implement a rollback or another way to revert the changes
  end
end

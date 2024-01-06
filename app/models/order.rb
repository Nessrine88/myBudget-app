class Order < ApplicationRecord
    has_many :order_items
  
    before_save :set_subtotal
  
    def subtotal
      order_items.sum { |order_item| order_item.unit_price * order_item.quantity }
    end
  
    private
  
    def set_subtotal
      self[:subtotal] = subtotal
    end
  end
  
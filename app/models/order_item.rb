class OrderItem < ApplicationRecord
  
  belongs_to :item
  
  def sum_of_price
    item.taxin_price * amount
  end
  
end

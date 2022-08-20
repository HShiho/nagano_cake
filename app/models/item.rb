class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_items,  dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

  def taxin_price
    (self.price * 1.1).floor
  end

  def sale_or_stop
    "#{is_active ? '販売中' : '販売停止中'}"
  end

  def success_color_or
    success_color = self.is_active
    case success_color
    when true
      "text-success"
    when false
      "text-secondary"
    else
      "text-primary"
    end
  end


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end


end

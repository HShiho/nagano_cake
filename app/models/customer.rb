class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses,  dependent: :destroy
  has_many :orders,     dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true

  def withdrawal_or_valibity
    "#{is_deleted ? '退会' : '有効'}"
  end

  def success_color_or
    success_color = self.is_deleted
    case success_color
    when false
      "text-success"
    when true
      "text-secondary"
    else
      "text-primary"
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end

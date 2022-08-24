class Address < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def select_register_addresses
    "〒" + self.postal_code + " " + self.address + "　" + self.name
  end


end

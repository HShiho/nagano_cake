class Address < ApplicationRecord

  belongs_to :customer

  def select_register_addresses
    "〒" + self.postal_code + " " + self.address + "　" + self.name
  end


end

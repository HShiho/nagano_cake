class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shopping_preparation: 3, sent: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum manufacture_status: { not_start: 0, waiting_for_production: 1, m_production: 2, complete: 3 }
  
  
  
end

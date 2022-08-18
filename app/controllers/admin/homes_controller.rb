class Admin::HomesController < ApplicationController
  layout 'admin'

  def top
    @orders = Order.all.order(created_at: :DESC)
  end
end

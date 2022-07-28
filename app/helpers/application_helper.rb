module ApplicationHelper

    class << self

      def digit_price(price)
        "#{price.to_s(:delimited, delimiter: ',' )}"
      end

      def tax_price(price)
        amount = price * 1.1
        tax = amount.floor
        "#{tax.to_s(:delimited, delimiter: ',' )}"
      end
      
      

    end

end

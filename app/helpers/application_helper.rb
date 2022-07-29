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
      
      def sale_or_stop(is_active)
        "#{is_active ? '販売中' : '販売停止中'}"
      end
      
      def full_name(last_name , first_name)
          last = last_name
          first = first_name
          full = last + first
          "#{full}"
      end

    end

end

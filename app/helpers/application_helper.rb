module ApplicationHelper

    class << self

      def full_name(last_name , first_name)
        last = last_name
        first = first_name
        full = last + first
        "#{full}"
      end

    end

end

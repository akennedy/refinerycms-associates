module NavigationHelpers
  module Refinery
    module Associates
      def path_to(page_name)
        case page_name
        when /the list of associates/
          admin_associates_path

         when /the new associate form/
          new_admin_associate_path
        else
          nil
        end
      end
    end
  end
end

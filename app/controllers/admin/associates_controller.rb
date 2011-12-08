module Admin
  class AssociatesController < Admin::BaseController

    crudify :associate,
            :title_attribute => 'name', :xhr_paging => true

  end
end

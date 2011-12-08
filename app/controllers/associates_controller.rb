class AssociatesController < ApplicationController

  before_filter :find_all_associates
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @associate in the line below:
    present(@page)
  end

  def show
    @associate = Associate.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @associate in the line below:
    present(@page)
  end

protected

  def find_all_associates
    @associates = Associate.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/associates").first
  end

end

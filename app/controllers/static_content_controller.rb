class StaticContentController < Spree::BaseController
  
  def show
    path = case params[:path]
    when Array
      '/' + params[:path].join("/")
    when String
      params[:path]
    when nil
      request.path
    end

    unless @page = Page.visible.find_by_slug(path)
      render_404
    end
  end
  
  private
  
  def accurate_title
    @page ? (@page.meta_title ? @page.meta_title : @page.title) : nil
  end
end


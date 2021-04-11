class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        format.js
      else
        format.js {render :index}
      end
    end
  end

  def go_to_link
    link = Link.find_by(short_url: params[:short_url])
    if !link || link.is_expired
      return render_404
    end

    redirect_to link.long_url
    begin
      # link.no_of_clicks += 1
      # link.save
      link.update_attribute(:no_of_clicks, link.no_of_clicks + 1)
    rescue Exception => e
      puts e
    end
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404_custom", status: :not_found
  end

  def link_params
    params.require(:link).permit(:long_url)
  end

end

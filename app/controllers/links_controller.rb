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

    redirect_to link.long_url
  end

  private

  def link_params
    params.require(:link).permit(:long_url)
  end

end

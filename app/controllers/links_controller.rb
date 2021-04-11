require 'net/http'
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
      record_stats(link)
    rescue Exception => e
      puts e
    end
  end

  def record_stats (link)
    stat = link.stats.new
    remote_ip = request.remote_ip
    # set hard-coded ip to test on localhost.
    # remote_ip = "103.48.110.191"  
    # remote_ip = "162.254.206.227"
    response = Net::HTTP.get( URI.parse( "https://www.iplocate.io/api/lookup/#{remote_ip}" ) )
    country = JSON.parse( response )["country"]
    # default country if not found by IP.
    country = "India" if !country  
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    stat.ip_address = remote_ip
    stat.country = country
    stat.browser = user_agent.browser
    stat.os = user_agent.platform
    stat.save
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404_custom", status: :not_found
  end

  def link_params
    params.require(:link).permit(:long_url)
  end

end

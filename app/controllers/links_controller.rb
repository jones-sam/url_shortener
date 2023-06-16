require 'uri'

class LinksController < ApplicationController
  def new
    @new_links = Link.order(created_at: :desc).limit(15)
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    # Add 'https://' to the link if it doesn't start with a protocol
    url = @link.url
    uri = URI.parse(url)
    url = "https://#{url}" unless uri.scheme

    @link.url = url

    if @link.save
      flash[:notice] = "Shortened link was successfully created."
      flash[:shortened_link] = "#{request.base_url}/#{@link.token}"
      redirect_to root_path
    else
      render :new
    end
  end

  def redirect
    @link = Link.find_by(token: params[:token])
    if @link
      @link.visits.create(ip_address: request.remote_ip)
      redirect_to @link.url, status: :moved_permanently, allow_other_host: true
    else
      redirect_to root_path, alert: 'Invalid token'
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end


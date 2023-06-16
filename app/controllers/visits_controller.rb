class VisitsController < ApplicationController
  def show
    @link = Link.find_by(token: params[:token])
    @visits = @link.visits
  end
end

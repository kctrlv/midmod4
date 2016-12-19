class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
    @links = Link.where(user: current_user)
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash[:error] = @link.errors.to_a
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end

require './app/services/hot_read_service'

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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path
    else
      flash[:error] = @link.errors.to_a
      redirect_to edit_link_path(@link)
    end
  end

  def read
    @link = Link.find(params[:id])
    @link.read_it
    redirect_to @link.url
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end

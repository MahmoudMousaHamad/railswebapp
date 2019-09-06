class PostsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @posts = Post.country_id(params[:country_id]).city(params[:city]).q_title(params[:q]).order_by(params[:order_by]).page(params[:page])
  end

  def show
    @i = Post.find(params[:id])
  end
end

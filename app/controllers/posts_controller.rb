class PostsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @posts = @country.posts.page(params[:page])
  end

  def show
    @i = Post.find(params[:id])
  end
end

class PostsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def show
    @i = Post.find(params[:id])
  end
end

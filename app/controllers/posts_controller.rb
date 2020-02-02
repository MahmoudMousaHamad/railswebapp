class PostsController < ApplicationController
  breadcrumb "Countries", :countries_path
  def index
    @country = Country.find(params[:country_id])
    @posts = Post.country_id(params[:country_id]).city(params[:city]).q_title(params[:q]).order_by(params[:order_by]).page(params[:page]).per(params[:results_per_page])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "News", country_posts_path(@country)
  end

  def show
    @i = Post.find(params[:id])
    @country = Country.find(params[:country_id])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "News", country_posts_path(@country)
    breadcrumb @i.title, country_post_path(@country, @i)
  end
end

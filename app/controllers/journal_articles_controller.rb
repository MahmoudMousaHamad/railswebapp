class JournalArticlesController < ApplicationController
  def show
    @article = JournalArticle.find(params[:id])
  end
end

class JournalArticlesController < ApplicationController
  def show
    @article = JournalArticle.find(params[:id])
    @journal = @article.issue.journal
  end
end

class JournalArticlesController < ApplicationController
  breadcrumb "Library", :library_path
  def show
    @article = JournalArticle.find(params[:id])
    @journal = @article.issue.journal
    @i = @article.issue
    breadcrumb @journal.title, journal_path(@journal, @i)
    breadcrumb "Issue No. #{@i.number}", issue_path(@i)
    breadcrumb @article.title, journal_article_path(@article)
  end
end

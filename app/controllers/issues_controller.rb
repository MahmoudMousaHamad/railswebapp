class IssuesController < ApplicationController
    breadcrumb "Library", :library_path
    def show
        @i = Issue.find(params[:id])
        @j = @i.journal
        breadcrumb @j.title, journal_path(@j, @i)
        breadcrumb "Issue No. #{@i.number}", issue_path(@i)
    end
end

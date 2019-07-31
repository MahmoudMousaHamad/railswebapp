class IssuesController < ApplicationController
    def show
        @i = Issue.find(params[:id])
        @j = @i.journal
    end
end

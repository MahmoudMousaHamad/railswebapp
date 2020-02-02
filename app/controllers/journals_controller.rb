class JournalsController < ApplicationController
    breadcrumb "Library", :library_path
    breadcrumb "Journals", :journals_path
    def index
        if params[:language] && !params[:language].empty?
            if params[:language] == "arabic"
                @journals_hash = Journal.where.not(arabic_title: [nil, ""]).published.order_by(:arabic_title).group_by{|u| u.arabic_title[0]}
            else
                @journals_hash = Journal.all.published.order_by(:title).group_by{|u| u.title[0].capitalize }
            end
        end
    end
    
    def show
        @j = Journal.find(params[:id])
        @issues = Issue.where("journal_id = ?", params[:id]).published.order(:year).reverse_order.group_by { |issue| issue.year / 10 if issue.year }
        breadcrumb @j.title, journal_path(@j)
    end
end

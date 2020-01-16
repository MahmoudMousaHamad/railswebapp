class JournalsController < ApplicationController
    def index
        if params[:language] && !params[:language].empty?
            if params[:language] == "arabic"
                @journals_hash = Journal.where.not(arabic_title: [nil, ""]).order_by(:arabic_title).group_by{|u| u.arabic_title[0]}
            else
                @journals_hash = Journal.where(arabic_title: [nil, ""]).order_by(:title).group_by{|u| u.title[0]}
            end
        end
    end
    
    def show
        @j = Journal.find(params[:id])
        @issues = Issue.where("journal_id = ?", params[:id]).order(:year).reverse_order.group_by { |issue| issue.year }
    end
end

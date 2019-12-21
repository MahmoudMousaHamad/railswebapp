class JournalsController < ApplicationController
    def index
        if params[:language] && !params[:language].empty?
            if params[:language] == :arabic
                @journals = Journal.where.not(arabic_title: [nil, ""]).published
            else
                @journals = Journal.where.not(arabic_title: [nil, ""]).published
            end
        end
    end
    
    def show
        @j = Journal.find(params[:id])
        @issues = Issue.where("journal_id = ?", params[:id]).order(:year).reverse_order.group_by { |issue| issue.year }
    end
end

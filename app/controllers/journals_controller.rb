class JournalsController < ApplicationController
    def show
        @j = Journal.find(params[:id])
        @issues = Issue.where("journal_id = ?", params[:id]).order(:year).reverse_order.group_by { |issue| issue.year }
    end
end

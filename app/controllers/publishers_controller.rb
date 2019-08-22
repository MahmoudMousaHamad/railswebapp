class PublishersController < ApplicationController
    
    def index
        @publishers_alphabetical = Publisher.all.group_by { |p| p.name[0] }.sort_by {|k, v| k}
    end

    def show
        @p = Publisher.find(params[:id])
        @journals = Journal.where('publisher_id = ?', @p.id)
        @books = Book.where('publisher_id = ?', @p.id)
    end
end

class PublishersController < ApplicationController
    def show
        @p = Publisher.find(params[:id])
        @journals = Journal.where('publisher_id = ?', @p.id)
        @books = Book.where('publisher_id = ?', @p.id)
    end
end

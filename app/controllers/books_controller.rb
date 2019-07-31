class BooksController < ApplicationController
    def show
        @b = Book.find(params[:id])
    end
end

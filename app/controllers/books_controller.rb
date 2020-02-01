class BooksController < ApplicationController
    def show
        @b = Book.find(params[:id])
        breadcrumb @b.title, book_path(@b)
    end
end

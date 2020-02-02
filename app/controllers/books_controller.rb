class BooksController < ApplicationController
    breadcrumb "Library", :library_path
    def show
        @b = Book.find(params[:id])
        breadcrumb @b.title, book_path(@b)
    end
end

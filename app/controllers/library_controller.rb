class LibraryController < ApplicationController

    def index
        if params[:q]
            if params[:category] == 'journals'
                @results = Journal.search(params[:q])
            end
            if params[:category] == 'books'
                @results = Books.search(params[:q])
            end
        end
    end

    def browse
        if params[:letter]
            @journals = Journal.order("title ASC").where("substr(title, 1, 1) = ? OR substr(title, 1, 1) = ?", params[:letter].upcase, params[:letter].downcase)
            @books = Book.order("title ASC").where("substr(title, 1, 1) = ? OR substr(title, 1, 1) = ?", params[:letter].upcase, params[:letter].downcase)
        end
    end

end
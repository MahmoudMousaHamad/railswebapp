class LibraryController < ApplicationController

    def basic_search
    end

    def index
        if params[:q]
            if params[:category] == 'journals'
                @results = Journal.basic_search(params[:q])
            end
            if params[:category] == 'books'
                @results = Book.basic_search(params[:q])
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

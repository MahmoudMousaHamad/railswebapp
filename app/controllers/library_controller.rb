class LibraryController < ApplicationController

    def basic_search
        q = params[:q]
        content_type = ""
        if params[:books] && params[:journals]
            content_type = "book and journal"
        elsif params[:books]
            content_type = "book"
        elsif params[:journals]
            content_type = "journal"
        else
            content_type = "book and journal"
        end

        if q
            @result = Search.new(q, content_type)
        end
    end

    def index
        if params[:q]
            redirect_to :action => "basic_search", :q => params[:q] 
        end
    end

    def browse
        if params[:letter]
            @journals = Journal.order("title ASC").where("substr(title, 1, 1) = ? OR substr(title, 1, 1) = ?", params[:letter].upcase, params[:letter].downcase)
            @books = Book.order("title ASC").where("substr(title, 1, 1) = ? OR substr(title, 1, 1) = ?", params[:letter].upcase, params[:letter].downcase)
        end
    end

    private
end

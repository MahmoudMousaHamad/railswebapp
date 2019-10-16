class LibraryController < ApplicationController

    def basic_search
        q = params[:q]
        from_year = params[:from_year].to_i
        to_year = params[:to_year].to_i

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
            @result = PgSearch.multisearch(q).page(params[:page]).per(params[:items_per_page])
            # @result = Search.new(q, content_type)
            # @result = @result.select { |i| i.class.name == "Journal" ? i.coverageFrom.to_i >= from_year : i.year >= from_year } if from_year != 0
            # @result = @result.select { |i| i.class.name == "Journal" ? i.coverageTo.to_i <= to_year : i.year <= to_year } if to_year != 0
            # @result = @result.select { |i| !(i.subjects.map { |s| s.name } & params[:search][:subjects]).empty? } if params[:search]
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
end

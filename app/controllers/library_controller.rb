class LibraryController < ApplicationController
    def basic_search
        q = params[:q]
        from_year = params[:from_year].to_i
        to_year = params[:to_year].to_i

        content_types = []
        if params[:books]
            content_types.push("Book")
        end
        if params[:journals]
            content_types.push("Journal")
        end
        if params[:academic_papers]
            content_types.push("AcademicPaper")
        end
        if content_types.length == 0
            content_types.push("Book")
            content_types.push("Journal")
            content_types.push("AcademicPaper")
        end
        if q
            @search_results = PgSearch.multisearch(q)
            @search_results = @search_results.select { |r| content_types.include? r.searchable_type}
            @search_results = @search_results.select do |r|
                if r.searchable_type == "Journal"
                    journal = Journal.find(r.searchable_id)
                    result = false
                    result = journal.coverageFrom >= from_year if from_year
                    result = result && journal.coverageTo <= to_year if to_year != 0
                    result = result && !(journal.subjects.map { |s| s.name } & params[:search][:subjects]).empty? if params[:search]
                    return result
                elsif r.searchable_type == "Book"
                    book = Book.find(r.searchable_id)
                    result = false
                    result = book.year >= from_year if from_year
                    result = result && book.year <= to_year if to_year != 0
                    result = result && !(book.subjects.map { |s| s.name } & params[:search][:subjects]).empty? if params[:search]
                    return result
                elsif r.searchable_type == "AcademicPaper"
                    paper = AcademicPaper.find(r.searchable_id)
                    result = false
                    result = paper.publication_year >= from_year if from_year
                    result = result && paper.publication_year <= to_year if to_year != 0
                    result = result && !(paper.subjects.map { |s| s.name } & params[:search][:subjects]).empty? if params[:search]
                    return result
                end
            end
            
            # @search_results = @search_results.select { |i| i.searchable_type.name == "Journal" ? i.coverageTo.to_i <= to_year : i.year <= to_year } if to_year != 0
            # @search_results = @search_results.select { |i| !(i.subjects.map { |s| s.name } & params[:search][:subjects]).empty? } if params[:search]

            # @categorized_results = []
            # @search_results.each do |r|
            #     if content_types.include?(r.searchable_type) && r.searchable_type == "Book"
            #         @categorized_results.push(Book.find(r.searchable_id))
            #     elsif content_types.include?(r.searchable_type) && r.searchable_type == "Journal"
            #         @categorized_results.push(Journal.find(r.searchable_id))
            #     elsif content_types.include?(r.searchable_type) && r.searchable_type == "AcademicPaper"
            #         @categorized_results.push(AcademicPaper.find(r.searchable_id))
            #     end
            # end
            # @categorized_results = @categorized_results.select { |i| i.class.name == "Journal" ? i.coverageFrom.to_i >= from_year : i.year >= from_year } if from_year != 0
            # @categorized_results = @categorized_results.select { |i| i.class.name == "Journal" ? i.coverageTo.to_i <= to_year : i.year <= to_year } if to_year != 0
            # @categorized_results = @categorized_results.select { |i| !(i.subjects.map { |s| s.name } & params[:search][:subjects]).empty? } if params[:search]
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

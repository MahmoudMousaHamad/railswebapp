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
            if !params[:results_per_page]
                results_per_page = 20
            else
                results_per_page = params[:results_per_page]
            end
            @search_results = PgSearch.multisearch(q)
            @search_results = @search_results.select { |r| content_types.include? r.searchable_type }
            @categorized_results = []
            @search_results.each do |r|
                if r.searchable_type == "Book"
                    @categorized_results.push(Book.find(r.searchable_id))
                elsif r.searchable_type == "Journal"
                    @categorized_results.push(Journal.find(r.searchable_id))
                elsif r.searchable_type == "AcademicPaper"
                    @categorized_results.push(AcademicPaper.find(r.searchable_id))
                end
            end
            if from_year != 0
                @categorized_results = @categorized_results.select do |i| 
                    class_name = i.class.name
                    if class_name == "Journal"
                        i.coverageFrom.to_i >= from_year 
                    elsif class_name == "Book"
                        i.year >= from_year
                    elsif class_name == "AcademicPaper"
                        i.publication_year >= from_year
                    end
                end
            end
            if to_year != 0
                @categorized_results = @categorized_results.select do |i| 
                    class_name = i.class.name
                    if class_name == "Journal"
                        i.coverageTo.to_i <= to_year 
                    elsif class_name == "Book"
                        i.year <= to_year
                    elsif class_name == "AcademicPaper"
                        i.publication_year <= to_year
                    end
                end
            end
            @categorized_results = @categorized_results.select { |i| !(i.subjects.map { |s| s.name } & params[:search][:subjects]).empty? } if params[:search]
            @categorized_results = Kaminari.paginate_array(@categorized_results).page(params[:page]).per(results_per_page)
        end
    end

    def index
        @disciplines = Discipline.all
    end

    def browse
        if params[:letter]
            @journals = Journal.order("title ASC").where("substr(title, 1, 1) = ? OR substr(title, 1, 1) = ?", params[:letter].upcase, params[:letter].downcase)
            @books = Book.order("title ASC").where("substr(title, 1, 1) = ? OR substr(title, 1, 1) = ?", params[:letter].upcase, params[:letter].downcase)
        end
    end
end

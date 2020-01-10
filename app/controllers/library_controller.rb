class LibraryController < ApplicationController
    def basic_search
        q = params[:q]
        from_year = params[:from_year].to_i
        to_year = params[:to_year].to_i
        field = params[:field]
        language = params[:language]

        content_types = []
        if params[:books]
            content_types.push("Book")
        end
        if params[:journals]
            content_types.push("Journal")
        end
        if params[:dissertations] || params[:conference_papers]
            content_types.push("AcademicPaper")
        end
        if content_types.length == 0
            content_types.push("Book")
            content_types.push("Journal")
            content_types.push("AcademicPaper")
        end
        if q
            if !params[:results_per_page] || params[:results_per_page] == "" || params[:results_per_page].to_i > 50
                results_per_page = 5
            else
                results_per_page = params[:results_per_page]
            end
            @search_results
            multisearch = field != "title" && field != "author" && field != "publisher"
            if field == "all"
                @search_results = PgSearch.multisearch(q)
            elsif field == "title"
                @search_results = Book.search_by_title(q) + AcademicPaper.search_by_title(q) + Journal.search_by_title(q)
            elsif field == "author"
                @search_results = Book.search_by_author(q) + AcademicPaper.search_by_author(q)
            elsif field == "publisher"
                @search_results = Book.search_by_publisher(q) + Journal.search_by_publisher(q)
            else
                @search_results = PgSearch.multisearch(q)
            end
            if multisearch
                @search_results = @search_results.select { |r| content_types.include? r.searchable_type }
            else
                @search_results = @search_results.select { |r| content_types.include? r.class.name }
            end
            @categorized_results = []
            @search_results.each do |r|
                content_type = ""
                content_id = 0
                if multisearch
                    content_type = r.searchable_type
                    content_id = r.searchable_id
                else
                    content_type = r.class.name
                    content_id = r.id
                end
                if content_type == "Book"
                    @categorized_results.push(Book.find(content_id))
                elsif content_type == "Journal"
                    @categorized_results.push(Journal.find(content_id))
                elsif content_type == "AcademicPaper"
                    academic_paper = AcademicPaper.find(content_id)
                    if params[:dissertations] == "on"
                        if academic_paper.paper_type == "Dissertation Paper"
                            @categorized_results.push(academic_paper)
                        end
                    elsif params[:conference_papers] == "on" 
                        if academic_paper.paper_type == "Conference Paper"
                            @categorized_results.push(academic_paper)                            
                        end
                    else
                        @categorized_results.push(academic_paper)
                    end
                end
            end
            if params[:language] && params[:language] != ""
                @categorized_results = @categorized_results.select { |i| language == i.language }                
            end
            if from_year != 0
                @categorized_results = @categorized_results.select do |i| 
                    class_name = i.class.name
                    if class_name == "Journal"
                        i.coverageFrom.to_i >= from_year if i.coverageFrom
                    elsif class_name == "Book"
                        i.year >= from_year if i.year
                    elsif class_name == "AcademicPaper"
                        i.publication_year >= from_year if i.publication_year
                    end
                end
            end
            if to_year != 0
                @categorized_results = @categorized_results.select do |i| 
                    class_name = i.class.name
                    if class_name == "Journal"
                        i.coverageTo.to_i <= to_year if i.coverageTo
                    elsif class_name == "Book"
                        i.year <= to_year if i.year
                    elsif class_name == "AcademicPaper"
                        i.publication_year <= to_year if i.publication_year 
                    end
                end
            end
            @categorized_results = @categorized_results.select { |i| !(i.subjects.map { |s| s.name } & params[:subjects]).empty? } if params[:subjects] != nil
            if params[:authors] != nil
                @categorized_results = @categorized_results.select do |i| 
                    if i.class.name == "Journal"
                        next
                    end
                    !(i.authors.map { |a| a.name } & params[:authors]).empty?
                end
                @categorized_results = Kaminari.paginate_array(@categorized_results).page(params[:page]).per(results_per_page)
            end
            
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

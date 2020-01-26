module LibrarySearchHelper
    def get_content_types_list(params)
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
        if params[:journal_articles]
            content_types.push("JournalArticle")
        end

        if content_types.length == 0
            content_types.push("Book")
            content_types.push("Journal")
            content_types.push("AcademicPaper")
            content_types.push("JournalArticle")
        end
        content_types
    end

    def get_results_per_page(params, default = 5)
        param = params[:results_per_page]
        if !param || param == "" || param.to_i > 50 || param.to_i < default
            results_per_page = 5
        else
            results_per_page = params[:results_per_page]
        end
        return results_per_page
    end

    def is_search_multisearch(search_field)
        multisearch = search_field != "title" && search_field != "author" && search_field != "publisher"
    end

    def get_search_results_based_on_query(search_field, q)
        search_results = []
        # multisearch (all fields)
        if search_field == "all"
            search_results = PgSearch.multisearch(q)
        # title field
        elsif search_field == "title"
            search_results = Book.search_by_title(q) + AcademicPaper.search_by_title(q) + Journal.search_by_title(q) + JournalArticle.search_by_title(q)
        # author field
        elsif search_field == "author"
            search_results = Book.search_by_author(q) + AcademicPaper.search_by_author(q) + JournalArticle.search_by_author(q)
        # publisher field
        elsif search_field == "publisher"
            search_results = Book.search_by_publisher(q) + Journal.search_by_publisher(q)
        else
            search_results = PgSearch.multisearch(q)
        end
        return search_results
    end

    # returns a hash
    def get_content_type_and_id_for_a_single_search_result(a_search_result, is_multisearch)
        content_type= ""
        content_id = 0
        if is_multisearch
            content_type = a_search_result.searchable_type
            content_id = a_search_result.searchable_id
        else
            content_type = a_search_result.class.name
            content_id = a_search_result.id
        end
        return { :id => content_id, :type => content_type }
    end

    def convert_a_pgsearch_result_to_active_record_object(id, type, params)
        return_active_record_object = nil
        if type == "Book"
            return_active_record_object = Book.find(id)
        elsif type == "Journal"
            return_active_record_object = Journal.find(id)
        elsif type == "JournalArticle"
            return_active_record_object = JournalArticle.find(id)
        # For AcademicPaper, make sure that the content_id and paper_type match
        elsif type == "AcademicPaper"
            academic_paper = AcademicPaper.find(id)
            if params[:dissertations] == "on"
                if academic_paper.paper_type == "Dissertation Paper"
                    return_active_record_object = academic_paper
                end
            elsif params[:conference_papers] == "on" 
                if academic_paper.paper_type == "Conference Paper"
                    return_active_record_object = academic_paper                          
                end
            else
                return_active_record_object = academic_paper
            end
        end
        return return_active_record_object
    end

    def filter_langauge(search_results, params)
        if params[:language] && params[:language] != ""
            search_results = search_results.select { |i| language == i.language if i.language }                
        end
        return search_results
    end

    def filter_from_year(from_year, search_results, params)
        if from_year != 0
            search_results = search_results.select do |i| 
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
        search_results
    end

    def filter_to_year(to_year, search_results, params)
        if to_year != 0
            search_results = search_results.select do |i| 
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
        search_results
    end

    def filter_authors(search_results, params)
        if params[:authors] != nil
            search_results = search_results.select do |i| 
                if i.class.name == "Journal"
                    next
                end
                !(i.authors.map { |a| a.name } & params[:authors]).empty?
            end
            # @categorized_results = Kaminari.paginate_array(@categorized_results).page(params[:page]).per(results_per_page)
        end
        search_results
    end
end
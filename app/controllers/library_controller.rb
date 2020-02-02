class LibraryController < ApplicationController
    include LibrarySearchHelper
    breadcrumb "Library", :library_path

    def basic_search
        breadcrumb "Search", library_basic_search_path
        # get search parameters
        q = params[:q]
        from_year = params[:from_year].to_i
        to_year = params[:to_year].to_i
        field = params[:field]
        language = params[:language]
        # get content types wanted
        content_types = get_content_types_list(params)

        if q
            # get results per page
            results_per_page = get_results_per_page(params)
            # get search results based on query
            multisearch = is_search_multisearch(field)
            search_results = get_search_results_based_on_query(field, q) 
            if multisearch
                search_results = search_results.select { |r| content_types.include? r.searchable_type }
            else
                search_results = search_results.select { |r| content_types.include? r.class.name }
            end
            # categorize and filter search results depending on search parameters 
            @categorized_results = []
            search_results.each do |r|
                # get the content type and id from our search results
                content_type_and_id = get_content_type_and_id_for_a_single_search_result(r, multisearch)
                content_id = content_type_and_id[:id]
                content_type = content_type_and_id[:type]
                # convert our PgSearch results into records using their content_id
                @categorized_results.push(convert_a_pgsearch_result_to_active_record_object(content_id, content_type, params))
            end
            # filter based on language
            @categorized_results = filter_langauge(@categorized_results, params)
            
            # filter based on form_year
            @categorized_results = filter_from_year(from_year, @categorized_results, params)            
            
            # filter based on to_year
            @categorized_results = filter_to_year(to_year, @categorized_results, params)                        
            
            # filter based on subjects chosen
            @categorized_results = @categorized_results.select { |i| !(i.subjects.map { |s| s.name } & params[:subjects]).empty? } if params[:subjects] != nil
            
            # filter based on authors chosen
            @categorized_results = filter_authors(@categorized_results, params)                        
            
            # finally, paginate results
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

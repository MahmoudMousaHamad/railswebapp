module FilterOrderHelper
    def filters_and_order_for(action, filters_order, params)
        FiltersOrder.new(self, action, filters_order, params).html
    end

    class FiltersOrder
        def initialize(view, action, filters_order, params)
            @view, @action, @filters_order, @params = view, action, filters_order, params
        end

        def html
            # Create form with action
                # Create nav element
                    # Create div with nav-wrapper search-container classes
                        # Create div with input-field class
                            # Create input element name="q" id="search" type="search" value="<%= params[:q]%>"
                            # Create a label element with class label-icon 
                            # <i class="material-icons">close</i>
                # Create select elements
                    # Create options for each select element
            content_tag(:div, form)
        end

        private 

        attr_accessor :view, :action, :filters_order, :params
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def form
            content = []
            content.push nav
            selects = []
            filters_order.each do |i|
                if i.class.name == "Hash"
                    selects.push custom_select("order_by", {:name => "Order by", :value => ""}, params[:order_by], i, true)
                elsif i == 'city-site'
                    selects.push select_city_site
                elsif i == 'site'
                    selects.push select_site
                elsif i == 'degree'
                    selects.push custom_select("degree", {:name => "All Degrees", :value => ""}, params[:degree], 
                    { "phd" => "PhD", "masters" => "Masters", "bachelor" => "Bachelor's" })
                elsif i == 'period'
                    selects.push custom_select("period", {:name => "All Periods", :value => ""}, params[:period], 
                        { "past" => "Past", "current" => "Current", "upcoming" => "Upcoming" })
                elsif i == 'university'
                    selects.push select_university
                elsif i == 'category'
                    selects.push select_category
                elsif i == 'museum_kind'
                    selects.push custom_select("kind", {:name => "All Kinds", :value => ""}, params[:kind], 
                        { "Archaeological" => "Archaeological",
                             "Heritage" => "Heritage",
                              "Other" => "Other" })
                elsif i == 'city'
                    selects.push select_city
                elsif i == 'results_per_page'
                    if !params[:results_per_page] || params[:results_per_page] == "" || params[:results_per_page].to_i > 50
                        results_per_page = 5
                    end
                    selects.push custom_select("results_per_page", {:name => "Results per Page", :value => ""}, params[:results_per_page], {5 => 5, 10 => 10, 20 => 20, 50 => 50})
                end
            end
            selects_content = content_tag(:div, safe_join(selects), class: "select-container")
            content.push selects_content
            content.push content_tag(:hr, nil)
            content_tag(:form, safe_join(content), :action => action)
        end

        def nav
            close_icon = content_tag(:i, "close", class: "material-icons")
            
            search_icon = content_tag(:i, "search", class: "material-icons")
            search_label = content_tag(:label, search_icon, class: "label-icon", :for => "search")
            
            input_field = content_tag(:input, nil, :name => "q", :id => "search", :type => "search", value: params[:q])
            
            input_field_div = content_tag(:div, safe_join([input_field, search_label, close_icon]), class: "input-field")

            nav_wrapper_div = content_tag(:div, input_field_div, class: "nav-wrapper search-container")

            content_tag(:nav, nav_wrapper_div)
        end

        def select_city_site
            city_options = []
            city_options.push content_tag(:option, "All Cities", :value => "")
            City.where("country_id = ?", params[:country_id]).each do |c|
                if c.id.to_s == params[:city]
                    city_options.push content_tag(:option, c.name, :value => c.id, :selected => "selected")
                elsif c.id != params[:city]
                    city_options.push content_tag(:option, c.name, :value => c.id)
                end
            end
            city_select = content_tag(:select, safe_join(city_options), :name => "city", :onchange => "this.form.submit();")
            
            city_chosen = false;
            if params[:city]
                if params[:city].length > 0
                    city_chosen = true;
                end
            end

            if city_chosen
                options = []
                options.push content_tag(:option, "All Sites", :value => "")
                Site.where("country_id = ?", params[:country_id]).where("city_id = ?", params[:city]).each do |s|
                    if s.id.to_s == params[:site]
                        options.push content_tag(:option, s.name, :value => s.id, :selected => "selected")
                    elsif s.id != params[:site]
                        options.push content_tag(:option, s.name, :value => s.id)
                    end
                end
                
                site_select = content_tag(:select, safe_join(options), :name => "site", :onchange => "this.form.submit();")
                content_tag(:span, safe_join([city_select, site_select]))
            else
                return city_select
            end
        end

        def select_site
            options = []
            options.push content_tag(:option, "All Sites", :value => "")
            Site.where("country_id = ?", params[:country_id]).each do |s|
                if s.id.to_s == params[:site]
                    options.push content_tag(:option, s.name, :value => s.id, :selected => "selected")
                elsif s.id != params[:site]
                    options.push content_tag(:option, s.name, :value => s.id)
                end
            end
            content_tag(:select, safe_join(options), :name => "site", :onchange => "this.form.submit();")
        end

        def select_university
            options = []
            options.push content_tag(:option, "All Universities", :value => "")
            University.where("country_id = ?", params[:country_id]).each do |u|
                if u.id.to_s == params[:university]
                    options.push content_tag(:option, u.name, :value => u.id, :selected => "selected")
                elsif u.id != params[:university]
                    options.push content_tag(:option, u.name, :value => u.id)
                end
            end
            content_tag(:select, safe_join(options), :name => "university", :onchange => "this.form.submit();")
        end

        def select_category
            options = []
            options.push content_tag(:option, "All Categories", :value => "")
            Category.all.each do |c|
                if c.id.to_s == params[:category]
                    options.push content_tag(:option, c.name, :value => c.id, :selected => "selected")
                else
                    options.push content_tag(:option, c.name, :value => c.id)
                end
            end
            content_tag(:select, safe_join(options), :name => "category", :onchange => "this.form.submit();")
        end

        def select_city
            options = []
            options.push content_tag(:option, "All Cities", :value => "")
            City.where("country_id = ?", params[:country_id]).each do |c|
                if c.id.to_s == params[:city]
                    options.push content_tag(:option, c.name, :value => c.id, :selected => "selected")
                else
                    options.push content_tag(:option, c.name, :value => c.id)
                end
            end
            content_tag(:select, safe_join(options), :name => "city", :onchange => "this.form.submit();")
        end

        def custom_select(name, first_option_hash, param_value, values_options, is_order = false)
            options = []
            options.push content_tag(:option, first_option_hash[:name], :value => first_option_hash[:value])
            values_options.each do |value, option|
                if param_value.to_s == value.to_s
                    options.push content_tag(:option, option, :value => value, :selected => "selected")
                else
                    options.push content_tag(:option, option, :value => value)
                end
            end
            content_tag(:select, safe_join(options), :name => name, :onchange => "this.form.submit();")
        end

    end
end
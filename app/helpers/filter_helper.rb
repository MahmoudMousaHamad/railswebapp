module FilterHelper
    def filters_for(action, filters, params)
        Filters.new(self, action, filters, params).html
    end

    class Filters
        def initialize(view, action, filters, params)
            @view, @action, @filters, @params = view, action, filters, params
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

        attr_accessor :view, :action, :filters, :params
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def form
            content = []
            content.push nav
            selects = []
            filters.each do |filter|
                if filter == 'degree'
                    selects.push custom_select("degree", params[:degree], 
                    { "phd" => "PhD", "masters" => "Masters", "bachelor" => "Bachelor's" })
                elsif filter == 'period'
                    selects.push custom_select("period", params[:period], 
                        { "past" => "Past", "current" => "Current", "upcoming" => "Upcoming" })
                elsif filter == 'university'
                    selects.push select_university
                elsif filter == 'category'
                    selects.push select_category
                elsif filter == 'museum_kind'
                    selects.push custom_select("kind", params[:kind], 
                        { "Archaeological" => "Archaeological",
                             "Heritage" => "Heritage",
                              "Other" => "Other" })
                end
            end
            selects_content = content_tag(:div, safe_join(selects), class: "select-container")
            content.push selects_content
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

        def select_university
            options = []
            options.push content_tag(:option, "All Universities", :value => "")
            University.where("country_id = ?", params[:country_id]).each do |u|
                if u.id.to_s == params[:university]
                    puts "inside selected"
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

        def custom_select(name, param_value, values_options)
            options = []
            options.push content_tag(:option, "All #{name.capitalize}s", :value => "")
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
module AdminNestedResourceHelper
    def nested_resource_links_for(resource, parent, children_array)
        anchor_elements = []
        children_array.each do |child|
            anchor_elements.push  content_tag :a, child.humanize, :href => "/admin/#{parent.pluralize}/#{resource.id}/#{child.pluralize}", :class => "active-admin-btn"
        end
        return anchor_elements
    end
end
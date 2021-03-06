ActiveAdmin.register Issue do
  menu parent: "Library"

  belongs_to :journal, optional: true

  controller do
    def create
      @issue = Issue.new(permitted_params[:issue])
      @issue.user_id = current_user.id
      @issue.save
      super
    end
  end

  permit_params :number, :year, :pageFrom, :pageTo, :journal_id, :user_id, :published, :collection_number
  
  form do |f|
    inputs do
      input :number
      input :year
      input :pageFrom, label: "Number of First Page"
      input :pageTo, label: "Number of Last Page"
      input :collection_number
      input :journal
      input :published if authorized? :publish, resource
    end
    actions
  end

  show do
    attributes_table do
      row :number
      row :year
      row :pageFrom, label: "Number of First Page"
      row :pageTo, label: "Number of Last Page"
      row :journal
    end
    panel "Articles" do
      div nested_resource_links_for(issue, "issue", ["journal_articles"])
    end
  end
end

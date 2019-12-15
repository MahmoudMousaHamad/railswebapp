ActiveAdmin.register Issue do
  menu parent: "Library"

  permit_params :number, :year, :pageFrom, :pageTo, :journal_id, :pdf, :downloadable
  
  form do |f|
    inputs do
      input :number
      input :year
      input :pageFrom, label: "Number of First Page"
      input :pageTo, label: "Number of Last Page"
      input :journal
      input :pdf, as: :file
      input :downloadable
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
      row :pdf do
        a "Click to Download", href: main_app.url_for(issue.pdf)
      end
    end
  end
end

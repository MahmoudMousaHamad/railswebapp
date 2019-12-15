ActiveAdmin.register Journal do
  menu parent: "Library"

  permit_params :title, :about, :coverageFrom, :coverageTo, :publisher_id, :isbn, :cover, :published, :keywords, :language, subject_ids: []
  
  form do |f| 
    inputs do
      input :title
      input :about, as: :text
      input :coverageFrom, label: "First Year of Publication"
      input :coverageTo, label: "Last Year of Publication"
      input :publisher
      input :isbn, label: "ISBN"
      input :cover, as: :file
      input :subjects, as: :check_boxes, collection: Subject.all
      input :language
      input :published
      input :keywords
    end
    actions
  end

  show do 
    attributes_table do
      row :title
      row :about, as: :text
      row :coverageFrom, label: "First Year of Publication"
      row :coverageTo, label: "Last Year of Publication"
      row :publisher
      row :isbn, label: "ISBN"
      row :cover do |c|
        div do
          image_tag image_path(main_app.url_for(journal.cover))
        end
      end
      table_for journal.subjects do
        column "Subjects" do |s|
          link_to s.name, [ :admin, s ]
        end
      end
    end
  end
end

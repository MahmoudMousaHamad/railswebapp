ActiveAdmin.register Book do

  permit_params :title, :about, :year, :author, :pages, :pdf, :cover, :publisher_id, subject_ids: []

  form do |f|
    inputs do
      input :title
      input :about, as: :text
      input :year
      input :pages
      input :author, label: "Author Name"
      input :publisher
      input :pdf, as: :file
      input :cover, as: :file
      input :subjects, label: 'Subjects', as: :check_boxes, collection: Subject.all
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :about, as: :text
      row :year
      row :pages
      row :author, label: "Author Name"
      row :publisher
      row :pdf do |pdf|
        div do
          a "Click to Download", href: main_app.url_for(book.pdf)
        end
      end
      row :cover do |c|
        div do
          image_tag image_path(main_app.url_for(book.cover))
        end
      end
      table_for book.subjects do
        column "Subjects" do |s|
          link_to s.name, [ :admin, s ]
        end
      end
    end
  end
end

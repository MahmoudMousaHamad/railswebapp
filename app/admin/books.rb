ActiveAdmin.register Book do

  permit_params :title, :about, :year, :pages, :pdf, :cover, :publisher_id, :keywords, :downloadable,
                :book_collection_id, :language, :isbn, :volume, :published,  author_ids: [], subject_ids: []

  form do |f|
    inputs do
      input :title
      input :about, as: :text
      input :year
      input :pages
      input :publisher
      input :pdf, as: :file
      input :cover, as: :file
      input :subjects, as: :check_boxes, collection: Subject.all
      input :authors, as: :check_boxes, collection: Author.all
      input :book_collection
      input :language
      input :isbn
      input :volume
      input :downloadable
      input :published
      input :keywords
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

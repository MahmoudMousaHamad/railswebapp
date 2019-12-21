ActiveAdmin.register Book do
  menu parent: "Library"

  controller do
    include DocumentsHelper
    def create
      @book = Book.new(permitted_params[:book])
      @book.user_id = current_user.id
      @book.save
      generate_and_save_library_id(@book, Book::BOOK_DOCUMENT_CODE)
      super
    end
  end

  permit_params :title, :about, :year, :pages, :pdf, :cover, :publisher_id, :keywords, :downloadable,
                :language, :isbn, :volume, :published, :library_id,  author_ids: [], subject_ids: []

  form do |f|
    inputs do
      input :title
      input :about, as: :text
      input :year
      input :pages
      input :publisher
      input :pdf, as: :file
      input :cover, as: :file
      input :subjects, as: :select, collection: Subject.published
      input :authors, as: :select, collection: Author.published
      input :language, collection: LanguageList::COMMON_LANGUAGES.map { |l| [l.name, l.name] }      
      input :isbn
      input :volume
      input :downloadable
      input :keywords
      input :published if authorized? :publish, resource
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
          a "Click to Download", href: main_app.url_for(book.pdf) if book.pdf.attached?
        end
      end
      row :cover do |c|
        div do
          image_tag image_path(main_app.url_for(book.cover)) if book.cover.attached?
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

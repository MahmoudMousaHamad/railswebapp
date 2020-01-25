ActiveAdmin.register JournalArticle do

  belongs_to :issue, optional: false

  before_create do |journal_article|
    journal_article.user_id = current_user.id
  end

  # menu parent: "Library"

  permit_params :title, :about, :issue_id, :published, :user, :downloadable, :page_from, :page_to, :file, :author_ids => [], :authors_attributes => [:id, :_destroy, :name]

  index do
    selectable_column 
    id_column
    column :title
    toggle_bool_column :published
    toggle_bool_column :downloadable
    column :user
    actions
  end

  form do |f|
    inputs do
      input :title
      input :about, as: :quill_editor
      input :issue_id, as: :hidden
      input :page_from
      input :page_to
      input :authors, as: :select, collection: Author.all
      inputs "Add New Authors" do
        f.has_many :authors, heading: 'Author(s)', allow_destroy: true do |a|
          a.input :name
        end
      end
      input :file, as: :file
      input :downloadable
      input :published if authorized? :publish, journal_article
    end
    actions
  end

end

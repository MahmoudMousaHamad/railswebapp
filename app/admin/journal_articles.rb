ActiveAdmin.register JournalArticle do

  belongs_to :issue, optional: true

  menu parent: "Library"

  permit_params :title, :about, :issue_id, :published, :user_id, :page_from, :page_to, :file, :author_ids => [], :authors_attributes => [:id, :name]

  controller do
    include DocumentsHelper
    def create
      @journal_article = JournalArticle.new(permitted_params[:journal_article])
      @journal_article.user_id = current_user.id
      @journal_article.save!
      super
    end
  end

  form do |f|
    inputs do
      input :title
      input :about, as: :quill_editor
      input :issue
      input :page_from
      input :page_to
      input :authors, as: :select, collection: Author.all
      inputs "Add New Authors" do
        f.has_many :authors, heading: 'Author(s)' do |a|
          a.input :name
        end
      end
      input :file, as: :file
      input :downloadable
      input :published
    end
    actions
  end

end

ActiveAdmin.register AcademicPaper do

  belongs_to :subject, optional: true
  belongs_to :author, optional: true

  menu parent: "Library"
  
  permit_params :title, :publication_year, :paper_type, :published, :keywords, :about, :pdf,
                :downloadable, :language, :user_id, :library_id, :supervisor_name, :university_name, :college_name, 
                :subject_ids => [], :author_ids => [], :authors_attributes => [:id, :name]


  controller do
    include DocumentsHelper
    def create
      @academic_paper = AcademicPaper.new(permitted_params[:academic_paper])
      @academic_paper.user_id = current_user.id
      @academic_paper.save!
      generate_and_save_library_id(@academic_paper, AcademicPaper::ACADEMICPAPER_DOCUMENT_CODE)
      super
    end
  end


  form do |f|
    actions
    inputs do
      input :title
      input :about, label: "Abstract"
      input :publication_year
      input :paper_type, collection: ["Conference Paper", "Dissertation Paper"]
      input :subjects, as: :select, collection: Subject.all
      input :authors, as: :select, collection: Author.all
      inputs do
        f.has_many :authors, heading: 'Author(s)' do |a|
          a.input :name
        end
      end
      input :downloadable
      input :language, collection: LanguageList::COMMON_LANGUAGES.map { |l| [l.name, l.name] }
      input :keywords
      input :pdf, as: :file, label: "PDF"
      input :supervisor_name
      input :university_name
      input :college_name
      input :published if authorized? :publish, academic_paper
    end
    actions
  end
    
end

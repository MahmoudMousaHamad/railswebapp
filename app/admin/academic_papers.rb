ActiveAdmin.register AcademicPaper do
  menu parent: "Library"
  
  controller do
    def create
      @academic_paper = AcademicPaper.new(permitted_params[:academic_paper])
      @academic_paper.user_id = current_user.id
      @academic_paper.save
      super
    end
  end

  permit_params :title, :publication_year, :paper_type, :published, :keywords, :about, :pdf, :downloadable, :language, :user_id, subject_ids: [], author_ids: []

  form do |f|
    inputs do
      input :title
      input :about, label: "Abstract"
      input :publication_year
      input :paper_type, collection: ["Conference Paper", "Dissertation Paper"]
      input :subjects, as: :select, collection: Subject.published
      input :authors, as: :select, collection: Author.published
      input :downloadable
      input :language, collection: LanguageList::COMMON_LANGUAGES.map { |l| [l.name, l.name] }
      input :keywords
      input :pdf, as: :file, label: "PDF"
      input :published if authorized? :publish, academic_paper
    end
    actions
  end
    
end

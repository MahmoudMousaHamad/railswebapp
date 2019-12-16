ActiveAdmin.register AcademicPaper do
  menu parent: "Library"
  
  permit_params :title, :publication_year, :paper_type, :published, :keywords, :about, :pdf, :downloadable, :language, subject_ids: [], author_ids: []

  form do |f|
    inputs do
      input :title
      input :about, label: "Abstract"
      input :publication_year
      input :paper_type, collection: ["Conference Paper", "Dissertation Paper"]
      input :subjects, as: :select, collection: Subject.all
      input :authors, as: :select, collection: Author.all
      input :published
      input :downloadable
      input :language, collection: LanguageList::COMMON_LANGUAGES.map { |l| [l.name, l.name] }
      input :keywords
      input :pdf, as: :file, label: "PDF"
    end
    actions
  end
    
end

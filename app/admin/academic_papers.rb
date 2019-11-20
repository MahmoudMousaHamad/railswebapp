ActiveAdmin.register AcademicPaper do

  permit_params :title, :publication_year, :paper_type, :published, :keywords, :about, :pdf, :downloadable, :language, subject_ids: [], author_ids: []

  form do |f|
    inputs do
      input :title
      input :about, label: "Abstract"
      input :publication_year
      input :paper_type, collection: ["Conference Paper", "Dissertation Paper"]
      input :subjects, as: :check_boxes, collection: Subject.all
      input :authors, as: :check_boxes, collection: Author.all
      input :published
      input :downloadable
      input :language
      input :keywords
      input :pdf, as: :file, label: "PDF"
    end
    actions
  end
    
end

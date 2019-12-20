module DocumentsHelper
    def generate_and_save_library_id(resource, document_code)
        first_subject = Subject.find(resource.subjects.first.id)
        subject_code = first_subject.code
        discipline_code = Discipline.find(first_subject.discipline_id).code
        resource.library_id = "#{discipline_code}#{subject_code}#{document_code}#{resource.id}"
        resource.save
    end
end
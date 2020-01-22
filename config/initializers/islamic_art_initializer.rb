art_discipline = Discipline.where(name: "Art")
if art_discipline == nil
    art_discipline = Discipline.new(name: "Art").save
end

islamic_art_subject = Subject.where(name: "Islamic Art")
if art_discipline == nil
    islamic_art_subject = Subject.new(name: "Islamic Art")
    islamic_art_subject.discipline_id = art_discipline.id
    islamic_art_subject.save
end
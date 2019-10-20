class AcademicPaper < ApplicationRecord
    include PgSearch::Model
    multisearchable against: [:title, :author, :about, :keywords],
                    if: :published?,
                    using: {
                        tsearch: {
                            StartSel: '<b>',
                            StopSel: '</b>',
                            MaxWords: 123,
                            MinWords: 456,
                            ShortWord: 4,
                            HighlightAll: true,
                            MaxFragments: 3,
                            FragmentDelimiter: '&hellip;'
                        }
                    }

    has_and_belongs_to_many :subjects
end

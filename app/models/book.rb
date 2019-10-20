class Book < ApplicationRecord
    include PgSearch::Model
    multisearchable against: [:title, :author, :about, :isbn, :keywords],
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

    include Filterable
    
    belongs_to :publisher
    belongs_to :book_collection, optional: true
    has_and_belongs_to_many :subjects

    has_one_attached :cover
    has_one_attached :pdf

    validates_presence_of :title, :about, :year, :author, :pages, :pdf, :cover, :publisher
end

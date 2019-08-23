class Search < ActiveRecord::Base
    belongs_to :searchable, :polymorphic => true

    def self.new(query, content_type)
        query = query.to_s
        return [] if query.empty?
        self.search(query).map(&:searchable)
        .select { |i| content_type.downcase.include? i.class.name.downcase }
    end

    def content_type(type)
        self
    end

    def readonly?; true; end

    def hash; [searchable_id, searchable_type].hash; end
    def eql?(result)
        searchable_id == result.searchable_id and
        searchable_type == result.searchable_type
    end
end
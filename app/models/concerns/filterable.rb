module Filterable
    extend ActiveSupport::Concern

    included do 
        scope :country_id, -> (country_id) { where("country_id = ?", country_id) if country_id}
        scope :city, -> (city_id) { where city_id: city_id  if city_id != "" && city_id }
        scope :site, -> (site_id) { where site_id: site_id  if site_id != "" && site_id }        
        scope :id, -> (id) { where id: id  if id != "" && id }                
        scope :category, -> (category_id) { where category_id: category_id if category_id }
        scope :q_name, -> (q) { where("name like ?", "%#{q}%") if q}
        scope :q_title, -> (q) { where("title like ?", "%#{q}%") if q}
        scope :kind, -> (kind) { where("kind like ?", "%#{kind}%") if kind}
        scope :degree, -> (degree) { where("UPPER(degree) like ?", degree.upcase) if degree}
        scope :university, -> (university_id) { where university_id: university_id if university_id}

        scope :order_by, -> (option) { order(option) }
    end

    module ClassMethods
        def filter(filtering_params)
            results = self.where(nil)
            filtering_params.each do |key, value|
                results = results.public_send(key, value) if value.present?
            end
            results
        end
    end
end
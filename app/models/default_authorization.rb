class DefaultAuthorization < ActiveAdmin::AuthorizationAdapter

    def authorized?(action, subject = nil)
        # if action == :update || action == :destroy
        #     subject.author == user
        # else
        #     true
        # end
        true
    end 

    def scope_collection(collection, action = nil)
        collection_item = collection.first
        user_country = Country.find_by(name: user.country) 
        if user.role == "member" || user.role == "leader"
            if collection_item.has_attribute?("university_id")
                university = University.find(collection_item.university_id)
                collection.where(university_id: university.country_id)
            elsif collection_item.class.name == "Country"
                collection.where(id: user_country.id)
            else
                collection.where(country_id: user_country.id)
            end
        else
            collection
        end
        
    end

end
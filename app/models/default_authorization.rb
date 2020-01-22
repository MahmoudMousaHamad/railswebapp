class DefaultAuthorization < ActiveAdmin::AuthorizationAdapter

    def authorized?(action, subject = nil)
        case subject
        when normalized(subject)
            if subject.class != Class
                if user.role == "member"
                    if action == :publish
                        return false
                    elsif action == :create && subject.class == Country
                        return false
                    elsif action == :update || action == :destroy || action == :delete
                        subject.user_id == user.id
                    else
                        return true
                    end
                elsif user.role == "leader"
                    if action == :create && subject.class == Country
                        return false
                    elsif action == :update || action == :delete || action == :destroy
                        if subject.user_id == user.id
                            return true
                        elsif User.find(subject.user_id).country == user.country
                            return true
                        end
                    else
                        return true
                    end
                elsif user.role == "superadmin"
                    true
                end
            else
                true
            end
        end
    end

    def scope_collection(collection, action = nil)
        collection_item = collection.first
        if !collection_item 
            return collection 
        end
        user_country = Country.find_by(name: user.country) 
        if user.role == "member" || user.role == "leader"
            if collection_item.class.name == "Country"
                collection.where(id: user_country.id)
            elsif collection_item.has_attribute?("country_id")
                collection.where(country_id: user_country.id)
            else
                collection
            end
        else
            collection
        end
        
    end

end
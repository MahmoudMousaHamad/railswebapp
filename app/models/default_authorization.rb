class DefaultAuthorization < ActiveAdmin::AuthorizationAdapter

    def authorized?(action, subject = nil)
        case subject
        when normalized(subject)
            if subject.class != Class
                if user.role == "member"
                    if !user_can_access?(user, subject)
                        return false
                    end
                    if action == :publish
                        return false
                    elsif action == :create && subject.class == Country
                        return false
                    elsif action == :update || action == :destroy || action == :delete
                        if subject.class == User
                            false
                        else
                            subject.user_id == user.id
                        end
                    else
                        return true
                    end
                elsif user.role == "leader"
                    if !user_can_access?(user, subject)
                        return false
                    end
                    if action == :create && subject.class == Country
                        return false
                    elsif action == :update || action == :delete || action == :destroy
                        if subject.class == User
                            return false
                        end
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
        if user.role == "superadmin"
            return collection
        end
        if !user_can_access?(user, collection_item)
            return false
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

    def user_can_access?(user, model)
        if user.resource_permissions == nil
            return false
        end

        if user.resource_permissions.empty?
            return false
        end

        if model.class == ActiveAdmin::Page
            return true
        end

        return user.resource_permissions.upcase.include?(model.class.name.upcase)
    end

end
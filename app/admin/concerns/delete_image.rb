module DeleteImage
    def self.extended(base)
        base.instance_eval do
            member_action :delete_photo, method: :delete do
                @p = ActiveStorage::Attachment.find(params[:id])
                @p.purge_later
                redirect_back(fallback_location: request.referer)   
            end
        end
    end
end
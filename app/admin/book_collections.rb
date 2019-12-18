ActiveAdmin.register BookCollection do
  menu parent: "Library"

  controller do
    def create
      @book_collection = BookCollection.new(permitted_params[:book_collection])
      @book_collection.user_id = current_user.id
      @book_collection.save
      super
    end
  end

  permit_params :name, :published

  form do |f|
    inputs do
      input :name
      input :published if authorized? :publish, book_collection      
    end
    actions
  end
  
end

class AuthorsController < ApplicationController
    breadcrumb "Authors", :authors_path
    def index
        @authors_alphabetical = Author.published.group_by { |p| p.name[0] }.sort_by {|k, v| k}
    end
    def show
        @author = Author.find_by(name: params[:name])
        breadcrumb @author.name, author_path(@author)
    end
end

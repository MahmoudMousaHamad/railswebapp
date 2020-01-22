class AuthorsController < ApplicationController
    def index
        @authors_alphabetical = Author.published.group_by { |p| p.name[0] }.sort_by {|k, v| k}
    end
    def show
        @author = Author.find_by(name: params[:name])
    end
end

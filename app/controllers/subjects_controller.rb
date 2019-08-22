class SubjectsController < ApplicationController
    def index
        @disciplines = Discipline.all
    end

    def show
        @subject = Subject.find_by(name: params[:name])
    end
end

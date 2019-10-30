class AcademicPapersController < ApplicationController
    def show
        @paper = AcademicPaper.find(params[:id])
    end
end

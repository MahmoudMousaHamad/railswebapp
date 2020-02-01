class AcademicPapersController < ApplicationController
    def show
        @p = AcademicPaper.find(params[:id])
        breadcrumb @p.title, academic_paper_path(@p)
    end
end

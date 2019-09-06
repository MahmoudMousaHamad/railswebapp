class CollegesController < ApplicationController
  def index
    @university = University.find(params[:university_id])
    @colleges = @university.colleges.page(params[:page])
  end

  def show
    @i = College.find(params[:id])
    @university = @i.university
    
  end
end

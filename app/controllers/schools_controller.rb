class SchoolsController < ApplicationController
  def index
    @college = College.find(params[:college_id])
    @university = University.find(params[:university_id])
  end

  def show
    @i = School.find(params[:id])
  end
end

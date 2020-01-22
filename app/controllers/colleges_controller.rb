class CollegesController < ApplicationController
  def index
    @university = University.find(params[:university_id]).published
    @colleges = @university.colleges.published.page(params[:page])
  end

  def show
    @i = College.find(params[:id])
    @university = @i.university
  end
end

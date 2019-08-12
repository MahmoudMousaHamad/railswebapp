class CollegesController < ApplicationController
  def index
    @university = University.find(params[:university_id])
  end

  def show
    @i = College.find(params[:id])
  end
end

class DisciplinesController < ApplicationController
  breadcrumb "Library", :library_path
  def show
    @discipline = Discipline.find_by(name: params[:name], published: true)
    breadcrumb @discipline.name, discipline_path(@discipline) if !@discipline.name
  end
end

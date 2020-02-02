class DisciplinesController < ApplicationController
  breadcrumb "Library", :library_path
  def show
    @discipline = Discipline.where(name: params[:name]).published.first
    breadcrumb @discipline.name, discipline_path(@discipline)
  end
end

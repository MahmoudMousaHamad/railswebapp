class DisciplinesController < ApplicationController
  def show
    @discipline = Discipline.where(name: params[:name]).published.first
  end
end

class DisciplinesController < ApplicationController
  def show
    @discipline = Discipline.where(name: params[:name]).first
  end
end

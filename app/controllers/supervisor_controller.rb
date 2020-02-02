class SupervisorController < ApplicationController
  breadcrumb "Library", :library_path
  def show
    @supervisor = Supervisor.find_by(name: params[:name])
  end
end

class SupervisorController < ApplicationController
  def show
    @supervisor = Supervisor.find_by(name: params[:name])
  end
end

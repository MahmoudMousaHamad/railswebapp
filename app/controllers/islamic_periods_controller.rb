class IslamicPeriodsController < ApplicationController
  def show
    @period = IslamicPeriod.find_by(name: params[:name])
  end

  def index
    @periods = IslamicPeriod.all
  end
end

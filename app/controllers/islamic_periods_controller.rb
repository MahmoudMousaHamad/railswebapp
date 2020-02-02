class IslamicPeriodsController < ApplicationController
  breadcrumb "Islamic Art", :islamic_periods_path
  def show
    @period = IslamicPeriod.find_by(name: params[:name])
    breadcrumb @period.name, islamic_period_path(@period)
  end

  def index
    @periods = IslamicPeriod.all.published
  end
end

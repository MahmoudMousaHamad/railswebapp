class ScholarshipsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def show
    @i = Scholarship.find(params[:id])
  end
end

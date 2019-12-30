class MembersController < ApplicationController
  def show
    @member = User.find(params[:format])
  end

  def index
    @leaders = User.where(role: "leader")
    @members_phd = User.where(role: "member").where(education_level: "PhD").group_by{|m| m.specialization }.values.each{|arr| arr.group_by{|m| m.country}}.flatten
    @members_masters = User.where(role: "member").where(education_level: "Master's").group_by{|m| m.specialization }.values.each{|arr| arr.group_by{|m| m.country}}.flatten
    @members_bachelors = User.where(role: "member").where(education_level: "Bachelor's").group_by{|m| m.specialization }.values.each{|arr| arr.group_by{|m| m.country}}.flatten
  end
end

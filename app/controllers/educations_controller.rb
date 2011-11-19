class EducationsController < ApplicationController
  def show
    if params[:all]
      @education = Person.find_by_id(params[:person_id]).educations
    else
      @education = Person.find_by_id(params[:person_id]).educations.find_by_id(params[:id])
    end
    respond_to do |format|
      format.json {render :json => {:success => true, :data => [@education]}}
    end
  end
end

class PositionsController < ApplicationController
  def show
    if params[:all]
      @position = Person.find_by_id(params[:person_id]).positions
    else
      @position = Person.find_by_id(params[:person_id]).positions.find_by_id(params[:id])
    end
    respond_to do |format|
      format.json {render :json => {:success => true, :data => [@position]}}
    end
  end
end

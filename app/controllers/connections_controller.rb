class ConnectionsController < ApplicationController
  def show
    if params[:all]
      @connection = Person.find_by_id(params[:person_id]).connections
    else
      @connection = Person.find_by_id(params[:person_id]).connections.find_by_id(params[:id])
    end
    respond_to do |format|
      format.json {render :json => {:success => true, :data => [@connection]}}
    end
  end
end

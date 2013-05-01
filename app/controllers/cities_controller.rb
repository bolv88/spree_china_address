class CitiesController < ApplicationController
  respond_to :js

  def index
    respond_with @cities_info = Spree::City.cities_group_by_state_id.to_json, :layout => nil
  end
end

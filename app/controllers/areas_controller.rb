  class AreasController < ApplicationController
    respond_to :js

    def index
      respond_with @areas_info = Spree::Area.areas_group_by_city_id.to_json, :layout => nil
    end
  end

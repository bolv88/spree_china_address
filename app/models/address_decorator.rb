Spree::Address.class_eval do
  belongs_to :city
  belongs_to :area

  validates :address1, :state_id, :city_id, :zipcode, :country, :presence => true

  attr_accessible :reciver_name, :country_id, :state_id, :city_id, :area_id, :is_default

  _validators.reject!{ |key, _| {"firstname" => true, "lastname" => true}.has_key? key }
  _validate_callbacks.each do |callback|
    callback.raw_filter.attributes.delete :firstname if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
    callback.raw_filter.attributes.delete :lastname if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
  end

end

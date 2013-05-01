Spree::State.class_eval do
   has_many :cities, :order => "id ASC"

   # table of { country.id => [ state.id , state.name ] }, arrays sorted by name
   # blank is added elsewhere, if needed
   def self.states_group_by_country_id
     state_info = Hash.new { |h, k| h[k] = [] }
     self.order('id ASC').each { |state|
       state_info[state.country_id.to_s].push [state.id, state.name]
     }
     state_info
   end 
end

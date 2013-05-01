class AddChinaAddressTable < ActiveRecord::Migration
  def up
    create_table :blublu_spree_cities do |t|  
      t.string :name
      t.string :abbr
    end

    create_table :blublu_spree_areas do |t|  
      t.string :name
      t.string :abbr
    end

    add_column :spree_addresses, :city_id, :integer, references: :blublu_spree_cities
    add_column :spree_addresses, :area_id, :integer, references: :blublu_spree_areas
    add_column :spree_addresses, :reciver_name, :string

    add_column :blublu_spree_areas, :city_id, :integer, references: :blublu_spree_cities
    add_column :blublu_spree_cities, :state_id, :integer, references: :spree_states

  end

  def down
  end
end

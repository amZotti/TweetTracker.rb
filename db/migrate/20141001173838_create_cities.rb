class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
       t.string :name, null: false
       t.string :slug, null: false
       t.text :keywords, array: true, default: []
       t.text :coordinates, array: true, default: []
       t.timestamps
    end
  end
end

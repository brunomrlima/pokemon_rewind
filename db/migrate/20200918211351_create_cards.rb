class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :backup,null: false, foreign_key: true, index: true
      t.string :name
      t.string :image_url
      t.string :image_url_hires
      t.text :description
      t.integer :national_pokedex_number
      t.string :evolves_from
      t.integer :hp

      t.timestamps
    end
  end
end

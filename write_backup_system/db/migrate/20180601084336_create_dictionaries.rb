class CreateDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionaries do |t|
      t.string :title
      t.text :contents
      t.string :status
      t.boolean :publish
      t.datetime :at_release

      t.timestamps
    end
  end
end

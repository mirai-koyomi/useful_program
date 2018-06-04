class CreateDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionaries do |t|
      t.string :title, :null => false
      t.text :contents, :null => false
      t.string :status, :null => false, :default => 'draft'
      t.boolean :publish, :null => false, :default => false
      t.datetime :at_release

      t.timestamps
    end
  end
end

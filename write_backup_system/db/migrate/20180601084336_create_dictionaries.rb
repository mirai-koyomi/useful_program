class CreateDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionaries do |t|
      t.string :title, :null => false, :index => true
      t.text :contents, :null => false, :index => true
      t.string :status, :null => false, :default => 'draft', :index => true
      t.boolean :publish, :null => false, :default => false, :index => true
      t.datetime :released_at

      t.timestamps
    end
  end
end

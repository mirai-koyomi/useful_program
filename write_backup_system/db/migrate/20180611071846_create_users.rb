class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :screen_name, :null => false, :index => true
      t.string :name, :null => false, :index => true
      t.string :password_digest, :null => false
      t.text :description
      t.text :comment

      t.timestamps
    end
  end
end

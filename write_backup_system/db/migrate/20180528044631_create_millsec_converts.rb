class CreateMillsecConverts < ActiveRecord::Migration[5.2]
  def change
    create_table :millsec_converts do |t|
      t.datetime :before_time, :null => false
      t.datetime :after_time, :null => false
      t.time :difference, :null => false
      t.float :millsec, :null => false
      t.string :comment

      t.timestamps
    end
  end
end

class CreateMillsecConverts < ActiveRecord::Migration[5.2]
  def change
    create_table :millsec_converts do |t|
      t.datetime :before_date, :null => false
      t.datetime :after_date, :null => false
      t.integer :time_diff, :null => false
      t.string :comment

      t.timestamps
    end
  end
end

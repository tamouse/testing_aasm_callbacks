class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :aasm_state
      t.string :name

      t.timestamps null: false
    end
  end
end
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
    	t.string :name, null: false
    	t.boolean :state, null: false, default: true
    	t.integer :vertical_id, null: false
      t.timestamps
    end
  end
end
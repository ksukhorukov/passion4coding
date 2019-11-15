class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
    	t.string :name, null: false
    	t.string :author, null: false
    	t.integer :category_id, null: false
    	t.boolean :state, null: false, default: true
      t.timestamps
    end
  end
end

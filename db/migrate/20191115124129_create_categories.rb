# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.boolean :state, null: false, default: true
      t.integer :vertical_id, null: false
      t.timestamps
    end
  end
end

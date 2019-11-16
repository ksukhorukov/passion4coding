# frozen_string_literal: true

class CreateVerticals < ActiveRecord::Migration[6.0]
  def change
    create_table :verticals do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end

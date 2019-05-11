class CreatePracticeAreas < ActiveRecord::Migration
  def change
    create_table :practice_areas do |t|
      t.string :name
    end
  end
end

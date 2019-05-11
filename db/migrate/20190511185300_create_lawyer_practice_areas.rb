class CreateLawyerPracticeAreas < ActiveRecord::Migration
  def change
    create_table :lawyer_practice_areas do |t|
      t.integer :lawyer_id
      t.integer :pracitce_area_id
    end
  end
end

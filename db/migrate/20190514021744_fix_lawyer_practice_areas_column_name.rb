class FixLawyerPracticeAreasColumnName < ActiveRecord::Migration
  def change
    rename_column :lawyer_practice_areas, :pracitce_area_id, :practice_area_id
  end
end

class PracticeArea < ActiveRecord::Base
  has_many :lawyer_practice_areas
  has_many :lawyers, through: :lawyer_practice_areas
end

class PracticeArea < ActiveRecord::Base
  has_many :lawyer_practice_areas
  has_many :lawyers, through: :lawyer_practice_areas

  def self.alpha
    self.all.sort {|a, b| a.name.capitalize <=> b.name.capitalize}
  end
end

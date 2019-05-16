class Lawyer < ActiveRecord::Base
  belongs_to :user
  has_many :lawyer_practice_areas
  has_many :practice_areas, through: :lawyer_practice_areas

  def slug
    self.name.downcase.gsub(" ", "-").gsub(/[!|@|#|$|%|^|&|*|.]/, "")
  end
end

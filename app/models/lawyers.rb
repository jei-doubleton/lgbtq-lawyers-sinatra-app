class Lawyer < ActiveRecord::Base
  belongs_to :user
  has_many :lawyer_practice_areas
  has_many :practice_areas, through: :lawyer_practice_areas

  def slug
    self.name.downcase.gsub(" ", "-").gsub(/[!|@|#|$|%|^|&|*|.]/, "")
  end

  def format_phone
     Phoner::Phone.default_country_code = '1'
     phone = Phoner::Phone.parse(self.phone_number)
     phone.format("%a-%f-%l")
  end

  def self.sorted_lawyers
    self.all.sort {|a, b| a.name <=> b.name}
  end

  def phone_display
    self.phone_number != nil ? self.format_phone : "none provided"
  end

  def cost_display
    self.cost != nil ? self.cost : "not provided"
  end

  def alpha_practice_areas
    self.practice_areas.sort {|a, b| a.name.capitalize <=> b.name.capitalize}
  end
end

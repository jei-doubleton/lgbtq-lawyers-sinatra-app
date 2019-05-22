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
end

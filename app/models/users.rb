class User < ActiveRecord::Base
  has_secure_password
  has_many :lawyers

  def slug
    self.downcase.gsub(" ", "-")
  end
end

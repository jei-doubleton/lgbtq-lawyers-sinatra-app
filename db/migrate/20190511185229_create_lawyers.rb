class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :LGBTQ_friendly?
      t.string :phone_number
      t.string :website
      t.string :cost
      t.integer :user_id
    end
  end
end

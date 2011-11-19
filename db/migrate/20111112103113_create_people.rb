class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :headline
      t.string :industry
      t.string :summary
      t.string :specialities
      t.string :interests
      t.string :picture_url
      t.string :public_profile_url
      t.string :location
      t.string :country
      t.string :honors
      t.string :associations
    end
  end
end

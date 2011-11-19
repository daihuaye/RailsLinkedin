class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :member_id      
      t.string :first_name
      t.string :last_name
      t.string :headline
      t.string :location
      t.string :country
      t.string :industry
      t.string :site_standard_profile_request
      t.string :picture_url
      t.references :person

      t.timestamps
    end
  end
end

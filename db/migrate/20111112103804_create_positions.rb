class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :linkedin_position_id
      t.string :title
      t.text :summary
      t.string :industry
      t.date :start_date
      t.date :end_date
      t.boolean :is_current
      t.string :company
      t.references :person

      t.timestamps
    end
  end
end

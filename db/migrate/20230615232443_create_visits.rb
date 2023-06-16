class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.string :ip_address
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :external_id
      t.string :picture_url
      t.float :rating

      t.timestamps
    end
  end
end

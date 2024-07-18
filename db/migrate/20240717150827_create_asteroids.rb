class CreateAsteroids < ActiveRecord::Migration[7.1]
  def change
    create_table :asteroids do |t|
      t.string :name
      t.date :approach_date
      t.jsonb :size

      t.timestamps
    end
  end
end

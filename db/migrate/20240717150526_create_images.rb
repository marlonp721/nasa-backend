class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :url
      t.string :title
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end

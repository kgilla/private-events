class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :when
      t.string :where
      t.string :title
      t.text :description
      t.integer :creator_id

      t.timestamps
    end
  end
end

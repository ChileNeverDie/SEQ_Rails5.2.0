class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.datetime :Detected_at
      t.text :Description
      t.string :BoL
      t.boolean :Status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

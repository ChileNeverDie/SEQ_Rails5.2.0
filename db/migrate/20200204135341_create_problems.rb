class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :Detected_at
      t.text :Description
      t.string :BoL
      t.string :Status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

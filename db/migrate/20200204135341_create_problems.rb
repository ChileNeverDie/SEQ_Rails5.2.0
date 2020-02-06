class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.datetime :Detected_at
      t.text :Description
      t.string :BoL
      t.string :Status
      t.string :ProductID
      t.string :ProductName
      t.string :CRNo
      t.string :Link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

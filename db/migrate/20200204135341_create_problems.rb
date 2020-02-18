class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.datetime :detected_at
      t.text :description
      t.string :lob
      t.string :status
      t.string :productid
      t.string :productname
      t.string :crno
      t.string :link
      t.string :supplier
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

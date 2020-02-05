class AddProductnameToProblem < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :ProductName, :string
  end
end

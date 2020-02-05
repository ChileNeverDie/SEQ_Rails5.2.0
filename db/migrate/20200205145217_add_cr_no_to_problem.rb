class AddCrNoToProblem < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :CRNo, :string
  end
end

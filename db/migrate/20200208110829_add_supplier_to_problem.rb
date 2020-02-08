class AddSupplierToProblem < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :Supplier, :string
  end
end

class AddLinkToProblem < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :link, :string
  end
end

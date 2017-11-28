class AddQuantityToItensGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :itens_groups, :quantity, :integer, default: 1
  end
end

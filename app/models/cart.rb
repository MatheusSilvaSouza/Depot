class Cart < ApplicationRecord
  has_many :itens_group, dependent: :destroy

  def add_product(product)
    current_item = itens_group.find_by(product_id: product.id)
    if !current_item
      current_item = itens_group.build(product_id: product.id)
    end
    current_item.quantity += 1
    current_item
  end
end

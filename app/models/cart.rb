class Cart < ApplicationRecord
  has_many :itens_group, dependent: :destroy
end

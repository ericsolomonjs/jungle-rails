class LineItem < ApplicationRecord

  belongs_to :order, dependent: :destroy_async
  belongs_to :product, dependent: :destroy_async

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end

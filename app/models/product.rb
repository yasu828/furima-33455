class Product < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :shipping
    belongs_to :prefecture
    belongs_to :waitday

end

class Product < ApplicationRecord
    belongs_to :user

    with_options presence: true do
        validates :product
        validates :explain
        validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    end

    # ActiveHashのアソシエーションとバリデーション
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :shipping
    belongs_to :prefecture
    belongs_to :waitday

    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :state_id
        validates :shipping_id
        validates :prefecture_id
        validates :waitday_id
    end
    # //ActiveHashのアソシエーションとバリデーション

end

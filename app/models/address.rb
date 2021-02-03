class Address < ApplicationRecord
    belongs_to :buydata

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
end

class Address < ApplicationRecord
    # attr_accessor :token
    # validates :token, presence: true
    belongs_to :buydata

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
end

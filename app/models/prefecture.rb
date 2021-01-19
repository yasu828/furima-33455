class Prefecture < ActiveHash::Base
    self.data = [
        { id: 1, name: '北海道' },
        { id: 2, name: '青森県' },
        ...
    ]

    include ActiveHash::Associations
    has_many :products
end

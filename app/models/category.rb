class Category < ActiveHash::Base
    self.data = [
        { id: 1, name: '--' },
        { id: 2, name: 'メンズ' },
        { id: 3, name: 'レディース' },
        { id: 4, name: '大人向け' },
        { id: 5, name: '子供向け' },
        { id: 6, name: 'シニア向け' },
        { id: 7, name: '中高生向け' },
      ]

    include ActiveHash::Associations
    has_many :products
end

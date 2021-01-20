class State < ActiveHash::Base
    self.data = [
        { id: 1, name: '--' },
        { id: 2, name: '新品、未使用' },
        { id: 3, name: '未使用に近い' },
        { id: 4, name: '傷や汚れ無し' },
        { id: 5, name: 'やや傷や汚れ有り' },
        { id: 6, name: '汚れ傷有り' },
        { id: 7, name: '状態は悪い' },
      ]
    
    include ActiveHash::Associations
    has_many :products
end

class AddressBuydatum
    include ActiveModel::Model
    attr_accessor :postalcode, :prefecture_id, :addtwo, :addthree, :building, :tel, :user_id, :product_id, :token

    
    with_options presence: true do
        validates :token

        validates :postalcode,  format: { with: /\A\d{3}[-]\d{4}\z/ }
        validates :addtwo
        validates :addthree
        validates :tel,          format: { with: /\A\d{10,11}\z/ }

        validates :user_id
        validates :product_id
    end


    validates :prefecture_id, numericality: { other_than: 1 }











    def save
        buydata = Buydata.create(user_id: user_id, product_id: product_id)
        Address.create(postalcode: postalcode, prefecture_id: prefecture_id, addtwo: addtwo, addthree: addthree, building: building, tel: tel, buydata_id: buydata.id)
       
    end
end



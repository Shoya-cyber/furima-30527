require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品購入情報を保存できる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入情報が保存できない時' do
      it 'tokenが空だと保存できないこと' do
        
      end
      it 'postal_codeが空だと保存できないこと' do
        
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        
      end
      it 'prefectureを選択していないと保存できないこと' do
        
      end
      it 'prefectureが1だと保存できないこと' do
        
      end
      it 'cityが空だと保存できないこと' do
        
      end
      it 'house_numberが空だと保存できないこと' do
        
      end
      it 'phone_numberが空だと保存できないこと' do
        
      end
      it 'phone_numberにハイフンが含まれていると保存できないこと' do
        
      end
      it 'phone_numberが桁以上だと保存できないこと' do
        
      end
  
    end
  end
end
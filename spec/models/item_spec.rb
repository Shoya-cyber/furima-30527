require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'nameが空では保存できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'nameが41文字以上では保存できない' do
          @item.name = ('a' * 41)
          @item.valid?
          expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
        end
        it 'infoが空では保存できない' do
          @item.info = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end
        it 'infoが1000文字以上では保存できない' do
          @item.info = ('a' * 1001)
          @item.valid?
          expect(@item.errors.full_messages).to include('Info is too long (maximum is 1000 characters)')
        end
        it 'category_idが空では保存できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'category_idが１では保存できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'sales_status_idが空では保存できない' do
          @item.sales_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status can't be blank")
        end
        it 'sales_status_idが１では保存できない' do
          @item.sales_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Sales status must be other than 1')
        end
        it 'shipping_fee_status_idが空では保存できない' do
          @item.shipping_fee_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
        end
        it 'shipping_fee_status_idが１では保存できない' do
          @item.shipping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
        end
        it 'prefecture_idが空では保存できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'prefecture_idが１では保存できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it 'scheduled_delivery_idが空では保存できない' do
          @item.scheduled_delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end
        it 'scheduled_delivery_idが１では保存できない' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
        end
        it 'priceが空では保存できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        # it 'priceが全角数字だと保存できない' do  ←メンターさんにこの項目はテストしなくて良いと言われました
        #   @item.price = '４００'               念のためコメントアウトで残しておきました
        #   binding.pry
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include
        # end
        it 'priceが299以下だと保存できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range.')
        end
        it 'priceが10,000,000以上だと保存できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range.')
        end
        it 'imageが空だと保存できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end
end

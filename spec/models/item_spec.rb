require 'rails_helper'
RSpec.describe User, type: :model do
    describe '投稿できる場合' do
      it '必要事項が全て入力されていたら購入できる' do
        expect(@item).to be_valid
      end
    end
      
      describe '商品出品機能が保存できない場合' do
        it 'imageがなければ投稿できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'conmapy_nameがなければ投稿できない' do
          @item.company_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Company_name can't be blank")
        end

        it 'nameがなければ投稿できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'nomikuchiがなければ投稿できない' do
          @item.nomikuchi = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Nomikuchi can't be blank")
        end

        it 'nomikataがなければ投稿できない' do
          @item.nomikata = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Nomikata can't be blank")
        end

        it 'descriptionがなければ投稿できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
      end
    end
class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '標準タイプ' },
    { id: 2, name: 'モジュールタイプ' },
    { id: 3, name: 'リクライニング・ティルトタイプ' },
    { id: 4, name: '電動タイプ' },
    { id: 5, name: 'コンパクトタイプ' },
    { id: 6, name: '軽量タイプ' },
    { id: 7, name: 'スポーツタイプ' },
    { id: 8, name: 'お子様用' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :item
  end
 
class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '綺麗な状態' },
    { id: 2, name: '問題なく使用可能' },
    { id: 3, name: '少し壊れているが使用可能' },
    { id: 4, name: '修理が必要' },
    { id: 5, name: '部品のみ' },
    { id: 6, name: 'その他(詳細を本文に記載して下さい)' },
    
  ]

  include ActiveHash::Associations
  has_many :item
  end
 
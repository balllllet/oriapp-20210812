class ScheduledDelivery< ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '数時間貸し出し' },
    { id: 2, name: '数日貸し出し' },
    { id: 3, name: '長期貸し出し' },
    { id: 4, name: '売却' },
    { id: 5, name: 'その他(詳細を本文に記載して下さい)' },
  ]

  include ActiveHash::Associations
  has_many :item
  end
 
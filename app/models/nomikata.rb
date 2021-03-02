class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '冷酒' },
    { id: 3, name: '常温' },
    { id: 4, name: 'ぬる燗' },
    { id: 5, name: '熱燗' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
  belongs_to :items
  end
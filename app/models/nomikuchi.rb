class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '辛口' },
    { id: 3, name: '甘口' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
  belongs_to :items
  
  end
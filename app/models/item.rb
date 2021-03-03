class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :company_name, length: { maximum: 40}
    validates :name, length: { maximum: 40}
    validates :description, length: { maximum: 1000 }
  end

  

  belongs_to :user
  has_many :comments

  
  belongs_to :nomikuchi
  belongs_to :nomikata

  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
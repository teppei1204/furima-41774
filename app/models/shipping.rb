class Shipping < ActiveHash::Base
  self.data = [
    { id: 1, name: '未定' },
    { id: 2, name: 'クロネコヤマト' },
    { id: 3, name: 'ゆうパック' },
    { id: 4, name: '佐川急便' }
  ]

  include ActiveHash::Associations
  has_many :items
end

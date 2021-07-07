class Order < ApplicationRecord
  validates :name, presence: true, format: { with: /([a-zA-Z][^\W\d]*)/ }
  validates :s_name, presence: true, format: { with: /([a-zA-Z][^\W\d]*)/ }
  validates :patronymic, presence: true, format: { with: /([a-zA-Z][^\W\d]*)/ }
  validates :phone, presence: true
  validates :email, presence: true, format: { with: /[\w]*+@[\w]*+\.+[A-Za-z]{2,3}/ }
  validates :weight, presence: true, format: { with: /(\d)*\.?(\d)*/ }
  validates :length, presence: true, format: { with: /(\d)*\.?(\d)*/ }
  validates :width, presence: true, format: { with: /(\d)*\.?(\d)*/ }
  validates :height, presence: true, format: { with: /(\d)*\.?(\d)*/ }
  validates :dep_address, presence: true
  validates :arr_address, presence: true
end

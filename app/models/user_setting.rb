class UserSetting < ApplicationRecord

  # This attributes should not be changed. Just because
  attr_readonly :user_id

  belongs_to :user
  belongs_to :interface_language, optional: true

  has_many :access_rights, through: :user

  has_one_attached :avatar, service: :public

  enum sex: { male: 1, female: 2, other: 3 }, _default: :other

  validates :user, uniqueness: true
  validates :name, allow_blank: true, length: { minimum: 1, maximum: 25 }
  validates :surname, allow_blank: true, length: { minimum: 1, maximum: 25 }
end

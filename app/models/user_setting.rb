class UserSetting < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :user_id

  belongs_to :user
  belongs_to :interface_language, optional: true

  has_many :access_rights, through: :user

  # Touching parent model is required for cache invalidation but it seems like rails 6 don't do this
  # This is possible place for bug
  has_one_attached :avatar, service: :public

  enum sex: { male: 1, female: 2, other: 3 }, _default: :other

  validates :user, uniqueness: true
  validates :name, allow_blank: true, length: { minimum: 1, maximum: 25 }
  validates :surname, allow_blank: true, length: { minimum: 1, maximum: 25 }
end

class Payment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  has_many :groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end

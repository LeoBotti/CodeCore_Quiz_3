class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true
  validates :ends_on, presence: true
  validates :reserve_price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validate :ends_on_cannot_be_in_the_past

  def ends_on_cannot_be_in_the_past
    errors.add(:ends_on, "can't be in the past") if
      !ends_on.blank? and ends_on < Date.today
  end
end

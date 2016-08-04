class Chest < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :gemstones

  VALID_NAME_REGEX = /\A[a-zA-z]{2,50}\z/
  validates :name,    presence: true,
                      format: { with: VALID_NAME_REGEX }
end

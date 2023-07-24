class Employee < ActiveRecord::Base
  belongs_to :store

  validate :first_name_cannot_be_empty,
           :last_name_cannot_be_empty,
           :hourly_rate_from_40_to_200

  validates :store, presence: true

  def first_name_cannot_be_empty
    if first_name.blank?
      errors.add(:first_name, "can't be empty")
    end
  end

  def last_name_cannot_be_empty
    if last_name.blank?
      errors.add(:last_name, "can't be empty")
    end
  end

  def hourly_rate_from_40_to_200
    if hourly_rate.present? && (hourly_rate < 40 || hourly_rate > 200)
      errors.add(:hourly_rate, "must be from 40 to 200")
    end
  end
end

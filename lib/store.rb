class Store < ActiveRecord::Base
  has_many :employees

  validate :name_must_have_minimum_3_characters,
           :annual_revenue_must_be_0_or_more,
           :must_have_men_or_women_apparel

  def name_must_have_minimum_3_characters
    if name.present? && name.length < 3
      errors.add(:name, "must have a minimum of 3 characters")
    end
  end

  def annual_revenue_must_be_0_or_more
    if annual_revenue.present? && annual_revenue < 0
      errors.add(:annual_revenue, "must be 0 or more")
    end
  end

  def must_have_men_or_women_apparel
    unless mens_apparel || womens_apparel
      errors.add(:base, "Store must carry men's or women's apparel")
    end
  end
end

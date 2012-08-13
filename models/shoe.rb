class Shoe < ActiveRecord::Base
  has_one :brand

  module Scopes
    def by_brand(brand)
      where(:brand_id => brand.id)
    end
  end

  def brand_name
    Brand.find(self.brand_id).name
  end

  extend Scopes
end
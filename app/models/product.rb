class Product < ActiveRecord::Base
  acts_as_taggable
  is_impressionable
  
  validates :title,:description, presence: true
  validates :price, presence: true, numericality: {:greater_than => 0, :less_than => 10000000}
   
  def self.search(keyword)
    tags = keyword.gsub(" ",",")
    Product.where("title like '%#{keyword}%' or description like '%#{keyword}%'") | Product.tagged_with(tags, :any => true)
  end
end

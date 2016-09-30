class Product < ActiveRecord::Base
  validates :name, :price, presence: true
  
  belongs_to :parent, class_name: "Product"
  has_many :line_items
  has_many :pictures, as: :picturable
  has_many :associated, class_name: "Product", foreign_key: "parent_id"

  scope :active, -> {where(status: true)}

  def active?
    status
  end
end

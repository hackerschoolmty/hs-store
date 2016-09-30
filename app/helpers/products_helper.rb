module ProductsHelper

  def product_status_label product
    product.status ? "Active" : "Inactive"
  end

  def products_combo
    Product.all.map { |product| [product.name, product.id] }
  end
end

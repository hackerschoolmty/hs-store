class AddPicturesCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pictures_count, :integer, default: 0
    add_column :users, :pictures_count, :integer, default: 0

    Product.all.each do |product|
      product.update_column(:pictures_count, product.pictures.count)
    end

    User.all.each do |user|
      user.update_column(:pictures_count, user.pictures.count)
    end
  end
end

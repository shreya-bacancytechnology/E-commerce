class SuppliersController < ApplicationController
	def order_mgmt
	@products =	Product.where(supplier_id:current_supplier.id).joins(orders: :user).pluck("users.name,products.name,orders.created_at,products.id")
	end
end
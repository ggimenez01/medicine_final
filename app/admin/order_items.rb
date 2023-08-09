# app/admin/order_items.rb

ActiveAdmin.register OrderItem do
  # Permit the attributes you want to be editable in Active Admin
  permit_params :order_id, :product_id, :quantity, :price

  # Define the columns to be displayed in the index page
  index do
    selectable_column
    id_column
    column :order
    column :product
    column :quantity
    column :price
    actions
  end

  # Add any filters you want to use on the index page
  filter :order
  filter :product
  filter :quantity
  filter :price

  # Define the form for the edit and new pages
  form do |f|
    f.inputs 'Order Item Details' do
      f.input :order
      f.input :product
      f.input :quantity
      f.input :price
    end
    f.actions
  end
end

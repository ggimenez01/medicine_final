# app/admin/order.rb

ActiveAdmin.register Order do
  # Permit the attributes you want to be editable in Active Admin
  permit_params :customer_id, :total, :status, :gst, :pst, :hst, :subtotal

  # Define the columns to be displayed in the index page
  index do
    selectable_column
    id_column
    column :customer
    column :subtotal
    column :gst
    column :pst
    column :hst
    column :total
    column :status
    column "Products" do |order|
      # Display the names of the first few products
      products_summary = order.order_items.limit(3).map { |item| item.product.name }.join(", ")
      # If there are more products, add a '...' at the end
      products_summary += "..." if order.order_items.count > 3
      products_summary
    end
    actions
  end

  # Add any filters you want to use on the index page
  filter :customer
  filter :total
  filter :status

  # Define the form for the edit and new pages
  form do |f|
    f.inputs 'Order Details' do
      f.input :customer
      f.input :subtotal
      f.input :gst
      f.input :pst
      f.input :hst
      f.input :total
      f.input :status
    end
    f.actions
  end

  # Custom show view with items list
show do
  attributes_table do
    row :customer do |order|
      link_to order.customer.name, admin_customer_path(order.customer)
    end
    row :subtotal
    row :gst
    row :pst
    row :hst
    row :total
    row :status
  end

  panel "Items" do
    table_for order.order_items.includes(:product) do
      column "Product Name" do |item|
        item.product.name
      end
      column :quantity
      column :price
      column "Subtotal" do |item|
        number_to_currency(item.price * item.quantity)
      end
    end
  end
end
end

class CustomersController < ApplicationController
  # This action will render the form for a new customer.

  def new
    @order = Order.new
    @order.build_customer # This line initializes a new Customer object within the Order object
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id
      flash[:success] = "Customer successfully created!"
      redirect_to orders_path
    else
      flash.now[:error] = "Failed to create the customer. Please check your entries."
      render :new
    end
  end

  private

  # Strong Parameters provide an interface for protecting sensitive model attributes from
  # end-user assignment.
  def customer_params
    params.require(:customer).permit(:name, :email, :address, :province_id)
  end
end

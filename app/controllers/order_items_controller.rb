class OrderItemsController < ApplicationController

    def create
        @order= current_order
        @order_item = @order.order_items.new(order_params)
        @order.save 
        session[:order_id]= @order.id
    end

    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
       
        if @order_item.update(order_params)
          redirect_to root_path, notice: 'Order item updated successfully!'
        else
          # Handle the case when the update fails, maybe re-render the edit form with errors
          render :edit
        end
      end
      def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
      
        if @order_item.destroy
          redirect_to root_path, notice: 'Order item destroyed successfully!'
        else
          # Handle the case when the destroy fails, maybe redirect to an error page or root_path
          redirect_to root_path, alert: 'Failed to destroy order item!'
        end
      end
      
    private 
    def order_params
        params.require(:order_item).permit(:product_id,:quantity)
        
    end
end

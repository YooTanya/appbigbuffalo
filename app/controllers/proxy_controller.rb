class ProxyController < ApplicationController
  def index
    ShopifyAPI::Base.site = Shop.find_by_name(params[:shop]).api_url

    @orders = ShopifyAPI::Order.find(:all, :params => {:created_at_min => 1.week.ago})
    @total = 0

    @product_sale_counts =Hash.new()

    @orders.each do |order|
      order.line_items.each do |line_item|
        if @product_sale_counts[line_item.product_id]
          @product_sale_counts[line_item.product_id] = @product_sale_counts[line_item.product_id] + line_item.quantity
        else
          @product_sale_counts[line_item.product_id] = line_item.quantity
        end
      end 
      @total += order.total_price.to_i
    end

    top_seller_stats = @product_sale_counts.max_by{|k,v| v}
    @product = ShopifyAPI::Product.find(top_seller_stats.first)

    @top_seller_count = top_seller_stats.last

    render :layout => false, :content_type => 'application/liquid'
  end

 
end
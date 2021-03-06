class ProxyController < ApplicationController
  # before_action :verify_request_source

  def index
    # params[:shop] = 'eazymo-test.myshopify.com'
    shop = Shop.where(shopify_domain: params[:shop]).first

    session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    ShopifyAPI::Base.activate_session(session)
    if(ShopifyAPI::ScriptTag.where(:src => "https://appbigbuffalo.herokuapp.com/script.js").count == 0)
      ShopifyAPI::ScriptTag.create(:event => "onload", :src => "https://appbigbuffalo.herokuapp.com/script.js")
    end
    @count = ShopifyAPI::ScriptTag.count
    # @orders = ShopifyAPI::Order.find(:all, :params => {:created_at_min => 1.week.ago})
    # @total = 0

    # @product_sale_counts =Hash.new()

    # @orders.each do |order|
    #   order.line_items.each do |line_item|
    #     if @product_sale_counts[line_item.product_id]
    #       @product_sale_counts[line_item.product_id] = @product_sale_counts[line_item.product_id] + line_item.quantity
    #     else
    #       @product_sale_counts[line_item.product_id] = line_item.quantity
    #     end
    #   end 
    #   @total += order.total_price.to_i
    # end

    # top_seller_stats = @product_sale_counts.max_by{|k,v| v}
    # if top_seller_stats.present?
    #   @product = ShopifyAPI::Product.find(top_seller_stats.first)
    #   @top_seller_count = top_seller_stats.last
    # end

    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    # @products = []
    render :layout => false, :content_type => 'application/liquid'
  end

  # private 
  #   def verify_request_source
  #     url_parameters = {
  #       "shop" => params[:shop],
  #       "path_prefix" => params[:path_prefix],
  #       "timestamp" => params[:timestamp]
  #     }

  #     sorted_params = url_parameters.collect{ |k, v| "#{k}=#{Array(v).join(',')}" }.sort.join

  #     calculated_signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha256'),
  #     ::Application.config.shopify.secret, sorted_params)

  #     raise 'Invalid signature' if params[:signature] != calculated_signature
  #   end
  def render_text
    render text: 'Hello World' and return
  end

  def render_text_liquid
    render text: 'Hello World Liquid', :layout => false, :content_type => 'application/liquid'
  end
end


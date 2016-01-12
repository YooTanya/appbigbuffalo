ShopifyApp.configure do |config|
  config.api_key = "e480c117278884d837e81db5a5707e2d"
  config.secret = "74873c75f226b74e3366b2a425d63082"
  config.redirect_uri = "http://appbigbuffalo.herokuapp.com/auth/shopify/callback"
  config.scope = "read_orders, read_products, write_script_tags"
  config.embedded_app = true
end

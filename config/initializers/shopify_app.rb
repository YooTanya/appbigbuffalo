ShopifyApp.configure do |config|
  config.api_key = "97af3c724173d91b10d90f2ddcc428c6"
  config.secret = "6d702bcc0f1201d3b4c1cd90a4c2978a"
  config.redirect_uri = "http://appbigbuffalo.herokuapp.com/auth/shopify/callback"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end

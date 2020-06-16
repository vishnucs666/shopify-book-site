class ProductsController < ApplicationController


  def create
    RestClient.post "https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@myownbookshelf.myshopify.com/admin/api/2020-04/products.json", :product=> {"title": "Burton 2020", "body": "Good snowboard!", "vendor":"Burton", "product_type":"Snowboard", "published":false}
  end

  def show
    products = RestClient.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@myownbookshelf.myshopify.com/admin/api/2020-01/products.json")
    @products = JSON.parse(products)
  end

  def product_list
    product = RestClient.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@myownbookshelf.myshopify.com/admin/api/2020-04/products/#{params["format"].to_i}.json")
    @product = JSON.parse(product)
  end
  
  def payment
    RestClient.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@myownbookshelf.myshopify.com/admin/api/2020-04/shopify_payments/payouts/623721858.json")
  end

  def send_email
     RestClient.post 'https://927d33e1393f4640856876310080503d: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@myownbookshelf.myshopify.com/admin/api/2020-04/draft_orders/994118539/send_invoice.json', :draft_order_invoice=> {"to": "vishnu.cs@techversantinfo.com", "from": "giju@techversantinfo.com", "bcc": ["anjana@techversantinfotech.com"], "subject":"Apple Computer Invoice", "custom_message": "Thank you for ordering!!"}
  end

end

class ProductsController < ApplicationController


  def add; end

  def create
    RestClient.post "https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@myownbookshelf.myshopify.com/admin/api/2020-04/products.json",:product=> {"title": params["title"], "body": params["body"], "vendor": params["vendor"], "product_type": params["prod_type"], "published":false, "variants": [{"option1": params["var1"],"price": params["price1"],"sku": "123", "inventory_quantity": params["qty1"]}, {"option1": params["var2"],"price": params["price2"],"sku": "123", "inventory_quantity": params["qty2"] }]}
    flash[:notice] = "Api has been successfully sent"
    redirect_to root_path
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

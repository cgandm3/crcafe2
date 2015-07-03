class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def amazon
	  request = Vacuum.new

	  request.configure(
	  	aws_access_key_id: ENV['aws_access_key_id'],
	  	aws_secret_access_key: ENV['aws_secret_access_key']
	  	associate_tag: ENV['associate_tag']
	  	)
	  params = {
	  	'SearchIndex' => ['GourmetFood']['CoffeeBeverages']
	  	'Keywords' => 'Costa Rican Coffee',
	  	'ResponseGroup' => "ItemAttributes,Images"
	  }
	  raw_products = request.item_search(query: params)
	  hashed_products = raw_products.to_h
	  @products = hashed_products['ItemSearchResponse']['Items']['Item']
  end
end


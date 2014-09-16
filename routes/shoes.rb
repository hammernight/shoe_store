class ShoeStore < Sinatra::Application

  get '/shoes' do
    @shoes = Shoe.all
    sort_shoes!
    haml :shoes
  end

  get '/shoes.json' do
    content_type :json
    shoes = Shoe.all
    shoes.to_json
  end

  get '/shoe/new' do
    flash[:notice] = "what"
    redirect '/'
  end

  get '/brand.json' do
    content_type :json
    brands = Brand.all
    brands.to_json
  end

  post '/brand' do
    brand = params[:brand]
    if brand == "Select Brand" or brand.nil?
      #take this out and add achievement
      flash[:notice] = "Please Select a Brand"
      redirect '/'
    else
      redirect "/brands/#{URI.escape(brand)}"
    end
  end

  get '/brands/:brand_name' do |brand_name|
    @brand_name = brand_name
    @shoes = Shoe.by_brand(Brand.find_by_name(brand_name))
    sort_shoes!
    haml :brand_view
  end

  get '/months/:month_name' do |month_name|
    @month_name = month_name.capitalize
    @title = "#@month_name's Shoes"
    @shoes = Shoe.find :all, :conditions => {:release_month => @month_name}
    sort_shoes!
    haml :month_view
  end

end
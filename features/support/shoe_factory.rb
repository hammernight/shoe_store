class ShoeFactory

  def self.create(params={})
    if Brand.find_by_name params[:brand].nil?
      brand = Brand.create :name => params[:brand]
      params[:brand] = brand
    end
    params[:name] ||= 'Test Shoe'
    params[:description] ||= 'This is a test shoe default description'
    params[:image] ||= 'http://www.vangoghgallery.com/images/starry-night.jpg'
    params[:release_month] ||= 'February'
    params[:price] ||= '$10,250'
    Shoe.create params
  end

end
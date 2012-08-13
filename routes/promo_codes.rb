class ShoeStore < Sinatra::Application

  post '/promo' do
    if params[:promo_code].nil? or params[:promo_code].eql? ''
      flash[:notice] = 'Please enter a promotional code'
    elsif params[:promo_code].empty?
      achieve! UsedPromocode
      @promo_code_message = PromoCode.promo_code_message
      @results = true
    elsif params[:promo_code].include? "'"
      achieve! PromoCodeSqlInjection
      haml :error
    elsif params[:promo_code].include? "<"
      achieve! PromoCodeCrossSiteScripting
      haml :error
    elsif params[:promo_code].chars.to_a.size > 255
      achieve! HackedPromoCodeSize
      haml :error
    elsif params[:promo_code].chars.to_a.size >= 100
      achieve! PromoCodeSize
      haml :error
    else
      # TODO do something with this email address
      flash[:notice] = "The code: #{params[:promo_code]} is not a valid promotional code"
    end
    redirect request.referrer
  end

end
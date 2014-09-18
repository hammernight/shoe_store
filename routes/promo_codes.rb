class ShoeStore < Sinatra::Application

  post '/promo' do
    if params[:promo_code].nil? or params[:promo_code].eql? ''
      flash[:alert_danger] = 'Please enter a promotional code'
    elsif params[:promo_code].include? "'"
      achieve! PromoCodeSqlInjection
      haml :error
    elsif params[:promo_code].include? '<'
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
      promo_code = PromoCode.new(params[:promo_code])
      promo_code.valid? ? flash[:flash_success] = promo_code.validation_message : flash[:alert_danger] = promo_code.validation_message
    end
    redirect request.referrer
  end

end
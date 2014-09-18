class ShoeStore < Sinatra::Application

  post '/remind' do
    if params[:email].nil? or params[:email].eql? '' or params[:email].empty?
      flash[:alert_danger] = 'Please enter an email address'
    elsif params[:email].include? "'"
      achieve! PromoCodeSqlInjection
      haml :error
    elsif params[:email].include? "<"
      achieve! PromoCodeCrossSiteScripting
      haml :error
    elsif params[:email].chars.to_a.size > 255
      achieve! HackedPromoCodeSize
      haml :error
    elsif params[:email].chars.to_a.size >= 100
      achieve! PromoCodeSize
      haml :error
    else
      # TODO do something with this email address
      @email = EmailNotification.new(params[:email])
      @email.valid? ? flash[:flash_success] = @email.validation_message : flash[:alert_danger] = @email.validation_message
    end
    redirect request.referrer
  end

  post '/available' do
    if params[:email].nil? or params[:email].eql? 'Email Address'
      flash[:notice] = 'Please enter an email address to be notified when this shoe is available'
    elsif params[:email].include? "<"
      achieve! AvailableEmailCrossSiteScripting
      haml :error
    elsif params[:email].include? "'"
      achieve! AvailableEmailSqlInjection
      haml :error
    else
      # TODO do something with this email address
      flash[:notice] = "Thanks!  We will notify you when this shoe is available at this email: #{params[:email]}"
    end
    redirect request.referrer
  end

end
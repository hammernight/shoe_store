class ShoeStore < Sinatra::Application

  post '/remind' do
    if params[:email].nil? or params[:email].eql? 'Email Address'
      flash[:notice] = 'Please enter an email address to be reminded of our new shoes'
    elsif params[:email].include? "<"
      achieve! EmailCrossSiteScripting
      haml :error
    elsif params[:email].include? "'"
      achieve! EmailSqlInjection
      haml :error
    else
      # TODO do something with this email address
      flash[:notice] = "Thanks!  We will notify you of our new shoes at this email: #{params[:email]}"
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
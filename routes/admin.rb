class ShoeStore < Sinatra::Application

  get '/admin/logs' do
    @requests = Request.all
    content_type 'text/plain', :charset => 'utf-8'
    erb :'admin/logs', :layout => false
  end

  get '/admin/stats' do
    @achievements = Achievement.all.group_by { |a| a.class }
    @requests = Request.all
    haml :'admin/stats', :layout => :admin
  end

  get '/admin/status' do
    content_type 'text/plain', :charset => 'utf-8'
    'OK'
  end

end
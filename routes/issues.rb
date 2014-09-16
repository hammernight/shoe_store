class ShoeStore < Sinatra::Application

  get '/issues' do
    @issues = Issue.all
    haml :issues
  end

  get '/issues.json' do
    content_type :json
    issues = Issue.all
    issues.to_json
  end

  get '/issues/new' do
    @issue = Issue.new
    haml :issue
  end

  post '/issue' do
    if params[:issue_title].nil? or params[:issue_description].nil?
      flash[:notice] = 'Please fill out the issue completely'
      redirect '/issue/new'
    else
      if Issue.find_by_title(params[:issue_title]).nil?
        issue = Issue.new :title => params[:issue_title], :description => params[:issue_description], :severity => params[:issue_severity]
        achieve! CreatedIssue
        if issue.save
          flash[:notice] = 'Your issue was logged!'
          redirect '/issues'
        else
          flash[:notice] = 'There was a problem saving the issue'
          redirect '/issue/new'
        end
      else
        flash[:notice] = 'This issue already exists'
        haml :issue
      end
    end
  end

end
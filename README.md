shoe_store
==========

This is a Sinatra app using cucumber taza and watir-webdriver. This was created so that I would be able to host an
app to write automation tutorials with


# Build Status
[ ![Codeship Status for hammernight/shoe_store](https://codeship.com/projects/1a8e01e0-0fe5-0134-05b4-5e067c09569b/status?branch=master)](https://codeship.com/projects/156811)


# deploying on heroku
* run:  ` heroku buildpacks:set https://github.com/heroku/heroku-buildpack-ruby `
* run:  ` heroku buildpacks:add https://github.com/gunpowderlabs/buildpack-ruby-rake-deploy-tasks `
* run:  ` heroku config:set DEPLOY_TASKS='db:migrate db:seed' `
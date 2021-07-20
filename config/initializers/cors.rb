Rails.application.config.middleware.insert_before 0, 
  allow do
    origin "https://beanstalk-frontend.herokuapp.com/"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # get services
  get '/services' do
    Service.all.to_json
  end

  # get specific service
  get '/services/:id' do
    service = Service.find(params[:id])

    { service: service, service_type: service.service_type, reviews: service.reviews }.to_json
  end


  #get list of bookings for specific service
  get '/services/:id/bookings' do
    service = Service.find(params[:id])

    result = Booking.where(service_id: service.id).to_json
  end

  #get list of reviews for specific service
  get '/services/:id/reviews' do
     service_id = params[:id]
     reviews = Review.where(service_id: service_id)
     reviews.to_json
  end

end

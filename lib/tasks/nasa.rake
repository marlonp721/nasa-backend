namespace :nasa do
    desc "Fetch APOD and Near-Earth Objects data from NASA API"
    task fetch_data: :environment do
      api_key = Rails.application.config.api_key_nasa
      nasa_service = NasaService.new(api_key)
      
      start_date = 7.days.ago.strftime('%Y-%m-%d')
      end_date = Date.today.strftime('%Y-%m-%d')
      
      apod_response = nasa_service.fetch_apod(start_date, end_date)
      unless apod_response['code'] == 500
        apod_response.each do |data|
          Image.find_or_create_by(date: data['date']) do |image|
            image.title = data['title']
            image.url = data['url']
            image.description = data['explanation']
          end
        end
      end
  
      asteroid_response = nasa_service.fetch_asteroids(start_date, end_date)
      unless asteroid_response['code'] == 500
        asteroid_response['near_earth_objects'].each do |date, asteroids|
          asteroids.each do |asteroid|
            Asteroid.find_or_create_by(name: asteroid['name']) do |a|
              a.approach_date = date
              a.size = asteroid['estimated_diameter']['kilometers']['estimated_diameter_max']
            end
          end
        end
      end
    end
end
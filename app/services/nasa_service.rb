class NasaService
    include HTTParty
    base_uri 'https://api.nasa.gov'
  
    def initialize(api_key)
      @api_key = api_key
    end
  
    def fetch_apod(start_date, end_date)
      self.class.get('/planetary/apod', query: { api_key: @api_key, start_date: start_date, end_date: end_date })
    end
  
    def fetch_asteroids(start_date, end_date)
      self.class.get('/neo/rest/v1/feed', query: { api_key: @api_key, start_date: start_date, end_date: end_date })
    end
end
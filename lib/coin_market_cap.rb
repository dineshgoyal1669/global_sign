class CoinMarketCap
  PAGE_SIZE = 10
  API_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"

  def self.get_list
    error_msg = "Something went wrong. Please try again later"
    begin
      response = call_service
      if response.code == 200
        HashWithIndifferentAccess.new(data: response["data"])
      else
        api_error = response["status"]["error_message"]
        NotificationMailer.notify(api_error).deliver_later
        HashWithIndifferentAccess.new(error_msg: error_msg)
      end  
    rescue StandardError => e
      NotificationMailer.notify(e.backtrace).deliver_later
      HashWithIndifferentAccess.new(error_msg: error_msg)
    end  
  end

  def self.call_service
    HTTParty.get(API_URL, :query => query, headers: headers)
  end  

  def self.query
    { 'limit' => PAGE_SIZE }
  end  

  def self.headers
    {
      'Accepts'=> 'application/json',
      'X-CMC_PRO_API_KEY' => Rails.application.credentials.crypto_api_key
    }
  end
end
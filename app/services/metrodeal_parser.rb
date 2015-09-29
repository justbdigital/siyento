class MetrodealParser
  ITEMS_URL = 'http://www.metrodeal.com/web_api/?request=loadDeals&page=1&category_id=0&by_category=false'


  def initialize
    @conn = Mechanize.new do |agent|
      agent.user_agent_alias =  'Windows Mozilla'
    end
  end

  def fetch
    response = @conn.get ITEMS_URL, [], 'http://www.metrodeal.com/category/All',  { 'Accept' => 'application/json', 'X-Requested-With' => 'XMLHttpRequest' }
    JSON.parse response.body, symbolize_names: true
  end
end

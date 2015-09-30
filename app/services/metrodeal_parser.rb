class MetrodealParser
  ITEMS_URL = 'http://www.metrodeal.com/web_api/?request=loadDeals&page=1&category_id=0&by_category=false'


  def initialize
    @conn = Mechanize.new do |agent|
      agent.user_agent_alias =  'Windows Mozilla'
    end
  end

  def fetch
    transform retrieve
  end

  def retrieve
    response = @conn.get ITEMS_URL, [], 'http://www.metrodeal.com/category/All',  { 'Accept' => 'application/json', 'X-Requested-With' => 'XMLHttpRequest' }
    JSON.parse response.body, symbolize_names: true
  end

  def transform input
    input[:deals].map do |item|
      {
        datasource: 'metrodeal',
        deal_url:  item[:link],
        image_url: item[:image],
        currency:  '₱',
        deal_price: parse_number(item[:price]),
        original_price: parse_number(item[:value]),
        discount: parse_number(item[:discount]),
        purchases: item[:sold_count].to_i,
        title: item[:title]
      }
    end
  end

  def parse_number input
    input.scan(/\d+/).first.to_i
  end
end

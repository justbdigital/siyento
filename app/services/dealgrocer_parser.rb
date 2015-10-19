class DealgrocerParser < ParserBase
  ITEMS_URL = "https://dealgrocer.com/api/v2/collections/recommendations/%s"

  def retrieve
    data = []
    5.times do |time|
      response = conn.get ITEMS_URL % (time + 1)
      data << response.body
    end
    data
  end

  def transform data
    data.flat_map do |item|
      parse item
    end
  end

  def parse data
    data = JSON.parse data, symbolize_names: true
    items = data[:data][:collection][:"deal-tiles"].flatten
    items.map do |item|
      {
        datasource: 'dealgrocer',
        deal_url:  deal_url(item),
        image_url: image_url(item),
        currency:  '₱',
        deal_price: parse_number(item[:"discount-price"]),
        original_price: parse_number(item[:"original-price"]),
        discount: item[:"percent-off"],
        title: item[:"short-name"]
      }
    end
  end

  def deal_url item
    "https://dealgrocer.com/#{item[:'target-url']}"
  end

  def image_url item
    "http:#{item[:'deal-photo']}"
  end
end

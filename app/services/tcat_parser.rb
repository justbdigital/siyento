class TcatParser < ParserBase
  ITEMS_URL = ["http://www.tcat.com.ph/","http://www.tcat.com.ph/99deals/"]

  def retrieve
    result = []
    ITEMS_URL.each do |url|
      response = conn.get url
      result << response.body
    end
    result
  end

  def transform responses
    responses.flat_map do |data|
      doc = Nokogiri::HTML data
      items = doc.css 'li.small'
      items.map do |item|
        parse item
      end
    end
  end

  def parse item
    image_url = item.css("a img")[0].attributes["src"].value
    deal_url = deal_url item
    deal_price = parse_number item.css(".info div div:nth-child(2) div:nth-child(3) span")[0].text
    original_price = parse_number item.css(".info div div:nth-child(2) div:nth-child(3)")[0].children[1].text
    title = item.css("a")[0].attributes["title"].value
    discount = parse_number item.css(".info div div:nth-child(2) div:nth-child(1)")[0].children[0].text

    {
      datasource: 'tcat',
      deal_url:  deal_url,
      image_url: image_url,
      currency:  '₱',
      deal_price: deal_price,
      original_price: original_price,
      discount: discount,
      title: title
    }
  end

  private

  def deal_url item
    deal_url = item.css("a")[0].attributes["href"].value
    "http://www.tcat.com.ph#{deal_url}"
  end
end

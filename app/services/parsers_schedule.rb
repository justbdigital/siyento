class ParsersSchedule
  def fetch_all

    parsers = Module.constants.select { |c| c =~ /Parser/ }
    parsers = parsers.map {|c| Object.const_get c }
                     .select {|c| c.ancestors.drop(1).include? ParserBase }
    parsers.each do |parser|
      save_to_db parser.new.fetch
    end
  end

  def save_to_db result
      result.each do |item|
        Offer.create! item
      end
  end
end

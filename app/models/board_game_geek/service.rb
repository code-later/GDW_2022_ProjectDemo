class BoardGameGeek
  class Service
    def collection(username:)
      res = client.get("collection/#{username}", { own: 1 })

      case res.status
      when 202 # accepted
        sleep 1
        collection(username:)
      when 200
        res.body.dig('items', 'item').map do |item|
          Game.new(
            id: item['objectid'],
            name: item.dig('name', '__content__'),
            picture: item['thumbnail'],
            rating: item.dig('stats', 'rating', 'bayesaverage', 'value').to_f
          )
        end
      else
        raise 'Something went wrong'
      end
    end

    private

    def client
      return @client if @client

      @client = Faraday.new(url: 'https://api.geekdo.com/xmlapi') do |f|
        f.response :xml
        f.adapter :httpclient
      end
    end
  end
end

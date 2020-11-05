require 'pry'
class Api
    attr_accessor :query

   

    def initialize(query)
        @query = query


    end

    def fetch_articles
        url = "http://newsapi.org/v2/everything?q=#{@query}&from=2020-10-05&sortBy=publishedAt&apiKey=fedc37138f114bd48c8ae8a239063753"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        articles = JSON.parse(response)

        articles["articles"][1..10]
    end

    def create_articles
        self.fetch_articles.each{|article| Article.new(article["title"], article["author"], article["url"], article["content"])}
    end

end

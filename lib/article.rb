class Article 
    attr_accessor :title, :author, :url, :content

    @@all = []

    # def initialize
    def initialize(title, author, url, content)
        @title = title
        @author = author
        @url = url
        @content = content
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear_all
        @@all = []
    end

    def self.display_articles
        puts "Please choose one of the following articles:(1-10)"
        self.all.each_with_index{|article, index| puts "#{index + 1}. #{article.title}"}
    end

    def self.display_article(index)
        article = self.all[index]
        # binding.pry
        puts "#{article.title} -- #{article.author}"
        puts "#{article.content}"

        puts "Would you like to view this article in browser?"
        puts "1. Yes"
        puts "2. No"
    
        input = gets.chomp
        index = input.to_i - 1
    
        if index == 0
            system("open #{article.url}")
        end
    end

end


class Cli 
    @@topics = ["election", "covid", "sports", "bitcoin", "programming"]

    def start
        puts "Welcome"
        puts "Please choose one of the following options to see current news articles:"
        self.display_topics
        index = self.initial_input
        query = Cli.topics[index]
        api = Api.new(query)
        api.create_articles
        Article.display_articles
        index = self.secondary_input

        Article.display_article(index)
        self.another_article?
        # binding.pry
    end

    def input_to_index(input)
        input.to_i - 1
    end



    def another_article?
        puts "Would you like to read another article?"
        puts "1. Yes"
        puts "2. No"
        input = gets.chomp
        index = input_to_index(input)

        if index == 0
            Article.clear_all
            self.start
        end
    end

    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "please select a number between 1 and 5"
            self.initial_input
        else 
            index
        end
    end

    def secondary_input
        input = gets.chomp
        index = input_to_index(input)
        if !index.between?(0,9)
            puts "please select a number between 1 and 10"
            self.secondary_input
        else 
            index
        end
    end

    def self.topics
        @@topics
    end

    def display_topics
        Cli.topics.each_with_index{|topic, index| puts "#{index+1}. #{topic.capitalize}"}
    end

end


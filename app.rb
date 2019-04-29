require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    
    @analyze_text = TextAnalyzer.new(text_from_user)
    @words = @analyze_text.count_of_words
    @vowels = @analyze_text.count_of_vowels
    @consonants = @analyze_text.count_of_consonants
    @common_letter = @analyze_text.most_used_letter.keys.first
    @usage = @analyze_text.most_used_letter.values.first
    erb :results
  end
end

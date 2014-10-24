require 'wordnik'
require 'sinatra'

get '/' do
  redirect 'input.html'
end

post '/results' do
  topic = Word.new params[topic]
  paragraphs = params[paragraphs]
  sentences = params[sentences]

  #Getting the list of related words
  slist = Wordnik.word.get_related(topic, :type => 'synonym')

  s = topic
  p = '' #placeholders for variables
  @results = ''

  paragraphs.times do
    sentences.times do
      s = '' #clears cache for sentence so another can be generated.
      10.times do #this should pull random words out of the structure and generate sentences.
        s = s + slist[0][words].sample + ' '
      end #This generates sentences by pulling out 10 random words and running them together
      p = p + s + '.'
    end #This generates paragraphs by creating each sentence
    @results = @results + p
  end #this loop generates lipsum by creating each paragraph

  erb :results
end

#get '/:parameter' do
# params[:parameter]
#end
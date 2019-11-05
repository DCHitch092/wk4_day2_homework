require ('sinatra')
require ('sinatra/contrib/all') if development?
require_relative ('./models/film')

also_reload ('./models/*')

get '/films' do
  @films = Film.all()
  erb( :'films/index')
end

get '/films/:num' do
  @film_id = params['num'].to_i
  @film = Film.select_by_id(@film_id)
    erb( :'films/each')
end

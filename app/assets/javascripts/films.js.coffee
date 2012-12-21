# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# apikey = 'qfe4te4dsrqabwgcq862rr3s'
apikey = 'e14d30d8866462614fa0b5a19b45e26f'
# baseUrl = 'http://api.rottentomatoes.com/api/public/v1.0'
baseUrl = 'http://api.themoviedb.org/'

# movieSearchUrl = baseUrl + '/movies.json?apikey=' + apikey
movieSearchUrl = baseUrl + '3/search/movie?api_key=' + apikey
movieLookUp = baseUrl + '3/movie/'
# pagelimit = '&page_limit=1'

# options = "&type=jsonp&plot=full&episode=1&limit=1&yg=1&mt=none&lang=en-US&offset=&aka=full&release=full"
query = "Human Lanterns"
# ?title= "Human Lanterns"
year = "1980"
# &year=1982

$ ->
	$('.films-table').tablesorter();

	$('tr.even, tr.odd').click ->
		#Slides Drawer Down
		current = $(this)
		unless (current.next().find('.drawer').length > 0)
			#Sets the query to the film title
			query = current.find('.film-title').text()
			year = current.find('.film-year').text()
			$.ajax
				dataType: 'json',
				url: movieSearchUrl + "&query=" + query + "&year=" + year
				success:  (data) ->
					film = data['results'][0]
					id = film.id
					console.log movieLookUp + id + '?api_key=' + apikey
					current.after('<tr class="drawer-row"><td colspan="20"><div class="drawer clearfix"><img src="http://cf2.imgobject.com/t/p/w154' + film.poster_path + '" /></div></td></tr>')
					$.ajax
						dataType: 'json',
						url: movieLookUp + id + '?api_key=' + apikey
						success:  (movie) ->
							console.log movie
							current.next().find('.drawer').append('<div class="movie-info"><p class="length">Length: ' + movie.runtime + ' minutes</p><p class="overview">' + movie.overview + '</p></div>')

					current.next().find('.drawer').css('background-image': 'url(http://cf2.imgobject.com/t/p/w780' + film.backdrop_path + ")")
					current.next().find('.drawer').slideToggle()

		current.next().find('.drawer').slideToggle()



	isAndroid = /android/i.test(navigator.userAgent.toLowerCase())

	unless (isAndroid)
		$('.fancybox-media').fancybox
			openEffect  : 'none',
			closeEffect : 'none',
			helpers : {
				media : {}
			}






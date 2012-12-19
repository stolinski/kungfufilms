# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# apikey = 'qfe4te4dsrqabwgcq862rr3s'
# baseUrl = 'http://api.rottentomatoes.com/api/public/v1.0'
baseUrl = 'http://imdbapi.org/'

# movieSearchUrl = baseUrl + '/movies.json?apikey=' + apikey

# pagelimit = '&page_limit=1'

options = "&type=json&plot=full&episode=1&limit=1&yg=1&mt=none&lang=en-US&offset=&aka=full&release=full"
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
				url: baseUrl + '?title=' + encodeURI(query) + '&year=' + encodeURI(year) + options,
				dataType: 'json',
				success:  (data) ->
					film = data[0]
					if data.total == 0
						current.after('<p>'+ 'Film not found on Rotten Tomatos' + '</p>')

					current.after('<tr class="drawer-row"><td colspan="7"><div class="drawer clearfix"><img src="' + film.poster + '" /></div></td></tr>')
					current.next().find('.drawer').append('<div class="movie-info"><p class="length">Length: ' + film.runtime + ' minutes</p></div>')
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






# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

apikey = 'qfe4te4dsrqabwgcq862rr3s'
baseUrl = 'http://api.rottentomatoes.com/api/public/v1.0'

movieSearchUrl = baseUrl + '/movies.json?apikey=' + apikey
pagelimit = '&page_limit=1'
query = "Human Lanterns"


$ ->
	$('.films-table').tablesorter();

	$('tr.even, tr.odd').click ->
		#Slides Drawer Down
		current = $(this)
		unless (current.next().find('.drawer').length > 0)
			#Sets the query to the film title
			query = current.find('.film-title').text()
			$.ajax
				url: movieSearchUrl + '&q=' + encodeURI(query) + pagelimit,
				dataType: 'jsonp',
				success:  (data) ->
					if data.total == 0
						current.after('<p>'+ 'Film not found on Rotten Tomatos' + '</p>')
					movies = data.movies
					$.each(movies, (index, movie) ->
						current.after('<tr class="drawer-row"><td colspan="7"><div class="drawer clearfix"><img src="' + movie.posters.profile + '" /></div></td></tr>')
						current.next().find('.drawer').append('<div class="movie-info"><p class="length">Length: ' + movie.runtime + ' minutes</p></div>')
						current.next().find('.drawer').slideToggle()
					)
		current.next().find('.drawer').slideToggle()



	isAndroid = /android/i.test(navigator.userAgent.toLowerCase())

	unless (isAndroid)
		$('.fancybox-media').fancybox
			openEffect  : 'none',
			closeEffect : 'none',
			helpers : {
				media : {}
			}






# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

apikey = 'qfe4te4dsrqabwgcq862rr3s'
baseUrl = 'http://api.rottentomatoes.com/api/public/v1.0'

movieSearchUrl = baseUrl + '/movies.json?apikey=' + apikey
pagelimit = '&page_limit=1'
query = "Human Lanterns"


$ ->
	$('tr.even, tr.odd').click ->
		#Slides Drawer Down
		current = $(this)
		current.next().find('.drawer').slideToggle()
		#Sets the query to the film title
		query = current.find('.film-title').text()
		$.ajax
			url: movieSearchUrl + '&q=' + encodeURI(query) + pagelimit,
			dataType: 'jsonp',
			success:  (data) ->

				movies = data.movies
				$.each(movies, (index, movie) ->
					current.next().find('.drawer').append('<img src="' + movie.posters.profile + '" />')
				)



	isAndroid = /android/i.test(navigator.userAgent.toLowerCase())

	unless (isAndroid)
		$('.fancybox-media').fancybox
			openEffect  : 'none',
			closeEffect : 'none',
			helpers : {
				media : {}
			}



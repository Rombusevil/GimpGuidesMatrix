; -*-scheme-*-
; Iber Parodi Siri 2016. No copyright.  Public Domain.
; Script based on the work of Nicholas DeClario 2009

(define (script-fu-tiled-guides image
			     drawable
			     size)
    (let* (
			(width (car (gimp-image-width image)))
			(height (car (gimp-image-height image)))
			(position 0)
			(imgsize height)
		)
		(gimp-image-undo-group-start image)

		(while (< (+ position size) imgsize)
			(set! position (+ size position))
			(gimp-image-add-hguide image position)
		)
		
		(set! position 0)
		(set! imgsize width)		
		(while (< (+ position size) imgsize)
			(set! position (+ size position))
			(gimp-image-add-vguide image position)
		)

		(gimp-image-undo-group-end image)
		(gimp-displays-flush)
  )
)

(script-fu-register "script-fu-tiled-guides"
  _"New Guide Matrix"
  "Adds a guide matrix every X pixels"
  "Iber Parodi Siri"
  "Iber Parodi Siri, 2016"
  "April 2016"
  ""
  SF-IMAGE      "Input Image"      0
  SF-DRAWABLE   "Input Drawable"   0
  SF-ADJUSTMENT _"Size (in pixels)" '(16 0 10000 1 10 0 1)
)

(script-fu-menu-register "script-fu-tiled-guides"
                         "<Image>/Image/Guides")

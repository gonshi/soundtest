###!
  *
  * VelocityJS.org (1.2.2). (C) 2014 Julian Shapiro.
  * MIT @license: en.wikipedia.org/wiki/MIT_License
  * VelocityJS.org jQuery Shim (1.0.1). (C) 2014 The jQuery Foundation.
  * MIT @license: en.wikipedia.org/wiki/MIT_License.
  *
###

###!
  *
  * Main Function
  *
###

if window._DEBUG
  if Object.freeze?
    window.DEBUG = Object.freeze window._DEBUG
  else
    window.DEBUG = state: true
else
  if Object.freeze?
    window.DEBUG = Object.freeze state: false
  else
    window.DEBUG = state: false

require "../js/velocity.min.js"
window.DUR = 500

$ ->
  $wrapper = $( ".wrapper-sound" )
  $icon_container = $( ".icon_container" )
  $icon = $icon_container.find( ".icon" )

  $modal_container = $( ".modal_container-sound" )
  $ok = $modal_container.find( ".ok" )

  audio = []
  audio_max = 5

  $ok.on "click", ->
    for i in [ 0...audio_max ]
      audio[ i ] = new Audio()
      audio[ i ].src = "audio/#{ i + 1 }.mp3"
      audio[ i ].play()
      audio[ i ].pause()

    $modal_container.velocity opacity: [ 0, 1 ], DUR, ->
      $modal_container.hide()


  $icon.on "touchstart", ( e )->
    _i = Math.floor( Math.random() * audio_max )
    audio[ _i ].currentTime = 0
    audio[ _i ].play()

    $( e.currentTarget ).velocity scale: [ 1.1, 1 ], DUR / 4
    .velocity scale: [ 1, 1.1 ], DUR / 4

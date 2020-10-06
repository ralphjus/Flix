# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

<img src="https://github.com/ralphjus/Flix/blob/main/Flix/Assets.xcassets/TrailerView.gif" width=250><br>

### Notes

~~Trailer viewing is imperfect. I am not sure if it is a logic, network, or debugging issue, but sometimes the modally presented trailer webpage needs to be closed and reopened to view the correct trailer.~~

**UPDATE 10/5/2020:** Trailer loading is fixed thanks to TA help! I have also added activity indicators as the trailer webpages load (not pictured).


Within the collectionView tab, I deviated away from superheros in favor of classic horror to keep in theme with the season.  :jack_o_lantern: :ghost:

I also utilized the "get/movie/{movie_id}/recommendations" call rather than "get/movie/{movie_id}/similar" becuase my objective was to return movies from the era of the Universal classic monster movies. For example, I used the movie_id for Universal's American version of Dracula (movie_id = 138) and "similar" returned generic vampire movies whereas "recommendations" returned more desireable results.

### TODO:
- [ ] Implement an alternative page to load if there is no trailer available from the database. As of now the app will just crash if it cannot find the index.
- [ ] Fix autoconstraints so that the details pages (and the newly added activity indicators) appear correctly on different devices/orientations. This will probably require orientation-dependant image manipulation that I still need to learn.

[Skull Icon](https://www.flaticon.com/free-icon/skull_556209?term=skull&page=1&position=1) made by [Freepik](http://www.freepik.com/) from [Flaticon](https://www.flaticon.com/)

film data provided by [TMDb](https://www.themoviedb.org/).

<img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_long_1-8ba2ac31f354005783fab473602c34c3f4fd207150182061e425d366e4f34596.svg" width=250>



---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough GIF

# iPhone orientations (Real Device)
<img src="https://github.com/ralphjus/Flix/blob/main/Flix/Assets.xcassets/iPhonePortrait.gif" width=250><br>

<img src="https://github.com/ralphjus/Flix/blob/main/Flix/Assets.xcassets/iPhoneLandscape.gif" width=500><br>

# iPad orientations (Emulated)
<img src="https://github.com/ralphjus/Flix/blob/main/Flix/Assets.xcassets/iPadPortrait.gif" width=250><br>

<img src="https://github.com/ralphjus/Flix/blob/main/Flix/Assets.xcassets/iPadLandscape.gif" width=500><br>
GIFs created with [ezgif](https://ezgif.com/).



### Notes
A good exercise in learning how to deploy on multiple Apple devices. This includes applying constraints appropriately as well as creating dynamic text that can scale to the device screen and variable text entries. 

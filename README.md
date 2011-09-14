# Gotham a cooperative console game
_written by: Scott Parrish_

### How do I launch the game?

    % bin/gotham

## How do I play?

_first off accept that it is an incomplete game, and doesn't actually have a way
to win yet_

After starting, you'll be asked to enter how many players you want, and which
character each player with play.

There are 4 statistics that each character has

<table>
<tr><th>Name</th><th>Detecting</th><th>Fighting</th><th>Bravery</th><th
>Gadgets</th><th>Home</th><th>Hideout</th></tr>
<tr><td> batman </td><td> 3 </td><td> 3 </td><td> 3 </td><td> 3 </td><td> "Heights" </td><td> "Batcave" </td></tr>
<tr><td> robin </td><td> 3 </td><td> 2 </td><td> 3 </td><td> 4 </td><td> "Financial District" </td><td> "Wayne Tower" </td></tr>
<tr><td> nightwing </td><td> 3 </td><td> 4 </td><td> 2 </td><td> 3 </td><td> "Bludhaven" </td><td> "the Loft" </td></tr>
<tr><td> batgirl </td><td> 4 </td><td> 3 </td><td> 2 </td><td> 3 </td><td> "Gotham Docks" </td><td> "Subway Station" </td></tr>
<tr><td> oracle </td><td> 5 </td><td> 1 </td><td> 2 </td><td> 4 </td><td> "Downtown" </td><td> "Clocktower" </td></tr>
<tr><td> huntress </td><td> 3 </td><td> 3 </td><td> 4 </td><td> 2 </td><td> "Little Italy" </td><td> "Aerie One" </td></tr>
<tr><th>Name</th><th>solve_crimer</th><th>fight_gangs</th><th>rescue_people</th><th
>short_term bonus</th><th>Home</th><th>Hideout</th></tr>
</table>

Detecting and Gadgets ate not currently used in the game.

You start the game in your hideout, with gang violence in the city rising and
disasters befalling the citizens.

Each of your turns will be preeeded by the situation in gotham getting worse,
followed by your chance to perform 4 actions.  Before each of your actions
you'll be given a summary of the local situation and a menu of actions you
can take.  fight_gangs reduce the street violence while rescue_people reduces
 the disaster level.  If your skill is above the current disaster level,
 you will redue the threat by 2.  Otherwise only by 1.

You have 24 turns to save gotham!

## TODO List

1.  Implement Gadgets
2.  Implement Fight Crime
3.  Implement Winning conditions.
4.  Create presenter(s) to decoouple engine from stdout
5.  improve presentation
6.  Balance game engine.


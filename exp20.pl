% Prolog database for planets

% Format: planet(Name, OrderFromSun, Diameter_km, Moons).

planet('Mercury', 1, 4879, 0).
planet('Venus', 2, 12104, 0).
planet('Earth', 3, 12742, 1).
planet('Mars', 4, 6779, 2).
planet('Jupiter', 5, 139820, 79).
planet('Saturn', 6, 116460, 83).
planet('Uranus', 7, 50724, 27).
planet('Neptune', 8, 49244, 14).

% Rule: find planet by order from the sun
planet_by_order(Order, Name) :-
    planet(Name, Order, _, _).

% Rule: find number of moons for a planet
planet_moons(Name, Moons) :-
    planet(Name, _, _, Moons).

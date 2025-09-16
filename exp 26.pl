% Prolog program for fruits and their colors

% Facts: fruit(Name, Color)
fruit(apple, red).
fruit(banana, yellow).
fruit(grape, green).
fruit(grape, purple).
fruit(orange, orange).
fruit(mango, yellow).
fruit(cherry, red).
fruit(watermelon, green).

% Rule: find fruit color
fruit_color(Fruit, Color) :-
    fruit(Fruit, Color).

% Prolog Expert System: Diet suggestion based on disease

% Facts: disease -> diet recommendation
diet(diabetes, 'Low sugar, high fiber foods, avoid sweets, more vegetables.').
diet(hypertension, 'Low salt diet, more fruits and vegetables, avoid fried and oily food.').
diet(obesity, 'Low calorie diet, avoid junk food, more exercise, include fruits and salads.').
diet(anemia, 'Iron rich foods like spinach, beetroot, pomegranate, jaggery.').
diet(heart_disease, 'Low fat, low cholesterol diet, avoid red meat, include oats and nuts.').
diet(ulcer, 'Soft and non-spicy foods, milk, banana, avoid acidic foods.').
diet(kidney_stone, 'Plenty of water, avoid spinach, tomato, nuts, include citrus fruits.').

% Rule: suggest diet based on disease
suggest_diet(Disease, Suggestion) :-
    diet(Disease, Suggestion).

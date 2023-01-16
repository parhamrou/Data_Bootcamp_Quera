-- Section1
    UPDATE foods
    SET foods.recipe = REPLACE(foods.recipe, '@hamid_ashpazbashi2', '@hamid_ashpazbashi')
-- Section2
    SELECT foods.id, foods.name, COALESCE(AVG(ratings.rate), 0) AS rating, COUNT(ratings.id) AS rate_count
    FROM foods
    LEFT JOIN ratings
    ON foods.id = ratings.food_id
    GROUP BY foods.id, foods.name
    ORDER BY rating DESC, rate_count DESC, foods.id DESC
    LIMIT 10
-- Section3
    SELECT foods.*, COALESCE(SUM(food_ingredients.amount * ingredients.price_per_unit), 0) AS total_price FROM foods
    LEFT JOIN food_ingredients
    ON foods.id = food_ingredients.food_id
    LEFT JOIN ingredients
    ON food_ingredients.ingredient_id = ingredients.id
    GROUP BY foods.id
-- Section4

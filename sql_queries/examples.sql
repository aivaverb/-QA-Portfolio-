-- 📊 Базовые запросы для проверки данных

-- 1. Фильтрация товаров по количеству на складе
SELECT id, product_name, current_stock 
FROM product 
WHERE current_stock IN ('20', '10');

-- 2. Переименование столбца
SELECT product_name AS товар 
FROM product;

-- 3. Диапазон цен
SELECT id, product_name, unit_price 
FROM product 
WHERE unit_price BETWEEN 0 AND 7600;

-- 4. Фильтр по производителям
SELECT product_name 
FROM product 
WHERE manufacturer_id = 1 OR manufacturer_id = 2;

-- 5. Исключение производителя
SELECT product_name 
FROM product 
WHERE NOT manufacturer_id = 4;

-- 6. Сортировка по количеству
SELECT product_name, current_stock 
FROM product 
ORDER BY current_stock ASC;

-- 7. Группировка по производителям
SELECT manufacturer_id, COUNT(*) AS количество_позиций 
FROM product 
GROUP BY manufacturer_id;

-- 📈 Агрегирующие функции

-- 8. Общая стоимость товаров
SELECT SUM(unit_price * current_stock) AS сумма_товаров_на_складе 
FROM product;

-- 9. Минимальная и максимальная цена
SELECT MAX(unit_price) AS максимальная_цена, 
       MIN(unit_price) AS минимальная_цена 
FROM product;

-- 10. Средняя цена
SELECT AVG(unit_price) AS средняя_цена 
FROM product;

-- 11. Производители с товарами на складе
SELECT manufacturer_id, COUNT(*) AS количество_товара_на_складе 
FROM product 
WHERE current_stock > 0 
GROUP BY manufacturer_id 
HAVING COUNT(*) > 0;

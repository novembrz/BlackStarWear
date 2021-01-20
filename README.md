# Дипломный проект для Skillbox

Реализованный облегченную версию клиент-серверного приложения - магазин "BlackStarWear"
Дизайн придумать самостоятельно  
Данные (категории и подкатегории) загружаются из json файла:
http://blackstarshop.ru/index.php?route=api/v1/categories
Данные (товары) загружаются из json файла:
http://blackstarshop.ru/index.php?route=api/v1/products&cat_id={id категории}

### Логика взаимодействия:
1.Экран списка категорий. 
Данные (категории и подкатегории) загружаются из http://blackstarshop.ru/index.php?route=api/v1/categories
Нужно показать загруженные категории, по нажатию переходить на экран подкатегорий

2.Экран подкатегорий
Нужно показать подкатегории выбранной категории. По нажатию переходить на экран списка товаров

3.Экран списка товаров
Данные (товары) загружаются из http://blackstarshop.ru/index.php?route=api/v1/products&cat_id={id категории}
Нужно показать картинку, название и стоимость товаров. По нажатию переходить в карточку товара

4.Карточка товара
Нужно показать галлерею фото товара, название, цену, описание, выбор цвета и размера (доступны разные размеры в зависимости от выбранного цвета)
Товар (с выбранным цветом и размером) можно положить в корзину (товары в корзине кэшируются) С этого экрана можно перейти на экран корзины

5.Экран корзины
Показывается список добавленных товаров (название, цена, картинка, цвет, размер) Товары из корзины можно удалить

### Использовано:
REST API, Realm, UICollectionViewCompositionalLayout, Core Animation

Feature: Sorting_items
  Background: user visits MTA store
    Given user visits MTA store

    @sort
    Scenario Outline: user might sort items by using 4 different filters
      When user clicks the "<button>" button on Homepage
      Then user can see the list of categories
      When user selects the "<category>" category
      And  user selects the "<subcategory>" subcategory from the category
      Then user can see the "<page>" page
      When user selects the "<selected_filer>" sorting order filter
      Then the items are sorted by "<actual_filter>" sorting order
      Examples:
      |button         |category     |subcategory      |page                 |selected_filer     |actual_filter    |
     |Каталог товарів|Телевізори   |LG             |Телевізори LG      |Спочатку дорогі    |Спочатку дорогі  |
      |Каталог товарів|Телевізори   |LG               |Телевізори LG        |Спочатку дешеві    |Спочатку дешеві  |
#      |Каталог товарів|Аудіо        |Samsung          |Навушники Samsung    |Спочатку популярні |Спочатку популярні |
#      |Каталог товарів|Аксесуари    |Зарядні пристрої |Зарядні пристрої до телефонів|По розміру знижки|По розміру знижки|
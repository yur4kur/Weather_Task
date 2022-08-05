![8458306E-DAF3-46C3-A5D3-1E2D7F2A5E85](https://user-images.githubusercontent.com/105720427/183049304-9208225e-6afa-4387-98d7-de6d7c29678f.jpeg)
![A9FE4B0B-3E1A-433F-8756-2B81DBD03E25](https://user-images.githubusercontent.com/105720427/183049313-00aa0e86-27ac-4dce-a474-202cca6de1fd.jpeg)

# Weather_Task
UIKit Weather application to get current weather and 3-hour forecast for 5 next days.

Основной использованный стек: UIKit, NavigationController, TableViewContoller, JSON, OpenWeatherMap APIs, MVC.

Краткое описание: Тестовый проект приложения для получения текущей погоды и прогноза погоды на следующие дни.

1. Проект полностью написан на UIKit.
2. Использован архитектурный паттерн MVC.
3. Использованы NavigationController и TableViewController.
4. Кастомные ячейки.
5. Реализована загрузка текущей погоды через OpenWeatherMap Current Weather API.
6. Реализована загрузка прогноза через OpenWeatherMap 5 Day Weather Forecast API.
7. Асинхронная загрузка.
8. Реализован всплывающй список сохраненных городов.
9. Подобран дизайн, добавлены AppIcon.

Пункты задания находящиеся в проектной стадии, планируемые к реализации:
1. Выбор сохраненного города, с последующей загрузкой текущей погоды и прогноза.
2. Добавление новых городов в список сохраненных.

Сложности с которыми столкнулся:
1. Несмотря на заявленную возможность, API не позволяет реализовать запросы на русском языке, поэтому все приложение реализовано на английском.
2. Не всегда приходит ответ с API при вводе названий городов, состоящих из двух слов (например, New York или Los Angeles).  

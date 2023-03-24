*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn

*** Test Cases ***
Переход на сайт:
    Open Browser            https://vkusvill.ru/       googlechrome
    set selenium speed      0.5s
    Сhecking For Text       //a[@class="HeaderMenuItem"]/span[contains(text(), "Каталог")]        Открыт другой сайт или кнопка "Каталог" отсутствует
    Checking for element    //header[@id="js-header"]                                             Шапки нет или сайт не тот
    Checking for element    //div[@class="VV22_Subscribe__Row"]                                   Нет формы рассылки или не тот сайт
    Checking for element    //footer[@class="Footer"]                                             Подвала нет или сайт не тот

Выбор места доставки:
   click element            //span[@class="HeaderBuy__SelectArrowWrp"]
   sleep                    2s
   Checking for element     //div[@class="VV_RWayChoiceModal__Inner"]                             Не открылось модальное окно выбора места доставки
   click element            //*[@id="Delivery__ShopSelect"]/div/div[1]/div/div/div[2]/div[1]/div[4]/div/div[2]/div/div/div/div/form[1]/div/div[1]/div/div/textarea
   input text               //*[@id="Delivery__ShopSelect"]/div/div[1]/div/div/div[2]/div[1]/div[4]/div/div[2]/div/div/div/div/form[1]/div/div[1]/div/div/textarea          Тверская
   sleep                    1s
   click element            //div[@title="Москва, ул 1-я Тверская-Ямская"]
   click element            //div[@class="Delivery__ShopSelectModal__AddressMapDelivHere js-delivery__shopselect--search-map-deliv-here"]
   click element            //*[@id="Delivery__ShopSelect"]/div/div[1]/div/div/div[2]/div[1]/div[4]/div/div[2]/div/div/div/div/form[1]/div/div[1]/div/div/textarea
   sleep                    1s
   click element            //div[@title="Москва, ул 1-я Тверская-Ямская, д. 2"]
   sleep                    1s
   click element            //a[@class="_delivery VV_Button _block js-delivery__service-select Delivery__ShopSelect--map_delivery_block"]
   click element            //button[@class="VV_Button _desktop-lg _tablet-lg _mobile-md js-delivery__shopselect-terms-accept _block"]
   sleep                    1s
   Сhecking no text         //span[contains(text(),"Доставка или самовывоз")]                   Не выбран способ доставки или кнопка не поменяла свой вид
   Сhecking For Text        //span[contains(text(),"Доставка сегодня")]                         Доставка не на сегодня или кнопка не поменяла свой вид

Морковь:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Морковь
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Морковь»")]  Поиск не выполнен или выполнен по другому слову
    click element           //a[@title="Морковь"]
    Сhecking For Text       //h1[contains(text(),"Морковь")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"30,60")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"0.68")]  Добавленное количество отличается от 0.68 кг или товар не добавлен
    sleep                   1s

Яйца:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Яйца
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Яйца»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[@title="Яйцо куриное С1"]
    Сhecking For Text       //h1[contains(text(),"Яйцо куриное С1")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"125,60")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Вареная колбаса:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Вареная колбаса
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Вареная колбаса»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[@title="Колбаса вареная «ВкусВилл»"]
    Сhecking For Text       //h1[contains(text(),"Колбаса вареная «ВкусВилл»")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"478,60")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Картофель:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Картофель
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Картофель»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[@title="Картофель"]
    Сhecking For Text       //h1[contains(text(),"Картофель")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"532,66")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1.59")]  Добавленное количество отличается от 1.59 кг или товар не добавлен
    sleep                   1s

Огурцы соленые:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Соленые огурцы
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Соленые огурцы»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[contains(text(),"Огурцы соленые, 400")]
    Сhecking For Text       //h1[contains(text(),"Огурцы соленые, 400")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"657,66")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Зеленый горошек:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Горошек
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Горошек»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[contains(text(),"Зеленый горошек Bonduelle Нежный 400")]
    Сhecking For Text       //h1[contains(text(),"Зеленый горошек Bonduelle Нежный 400")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"756,66")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Майонез:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Майонез
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Майонез»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[contains(text(),"Майонез «Провансаль Слобода»,375")]
    Сhecking For Text       //h1[contains(text(),"Майонез «Провансаль Слобода»,375")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"861,66")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Зеленый лук:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Лук
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Лук»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[contains(text(),"Лук зеленый, 50")]
    Сhecking For Text       //h1[contains(text(),"Лук зеленый, 50")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"903,66")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Зелень:
    click element           //button[@class="HeaderSearchBlockShower js-vv21-search-modal-shower"]
    input text              //input[@placeholder="Найти продукты"]                                          Укроп
    press keys              //input[@placeholder="Найти продукты"]                                          RETURN
    Checking for element    //span[@class="js-search-total-num"][contains(text(), "по запросу «Укроп»")]     Поиск не выполнен или выполнен по другому слову
    click element           //a[contains(text(),"Микс укроп, петрушка, 50")]
    Сhecking For Text       //h1[contains(text(),"Микс укроп, петрушка, 50")]                                                Переход не выполнен или выполнен, но на другую страницу
    click element           //button[@class="CartButton__content CartButton__content--add js-delivery__basket--add"]
    sleep                   1s
    Сhecking For Text       //span[@class="js-delivery__basket--totals_products-price"][contains(text(),"953,66")]  Товар не добавлен или цена изменилась
    Сhecking For Text       //div[@class="CartButton__quantityInputLineVal"]/span[contains(text(),"1")]  Добавленное количество отличается от 1 шт или товар не добавлен
    sleep                   1s

Проверка корзины:
    click element           //a[@title="Корзина"]
    Checking for element    //div[@id="js-nav-chain"]/div/div/nav/span/span/span[@itemprop="name" and contains(text(),"Корзина")]       Переход в корзину не осуществлен
    Сhecking For Text       //div[contains(text(),"Корзина")]                                                                           Переход в корзину не осуществлен
    Сhecking For Text       //span[@class="js-delivery__basket--totals_q" and contains(text(),"9 товаров")]                             Количество товаров посчитано неверно или какой-то товар не добавлен
    Сhecking For Text       //span[@class="js-delivery__basket--totals_weight" and contains(text(),"4.5")]                              Вес товаров посчитан неверно или какой-то товар не добавлен
    Сhecking For Text       //a[@data-code="morkov" and contains(text(),"Морковь")]                                                     Моркови нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="yaytso-kurinoe-s1" and contains(text(),"Яйцо куриное С1, 550")]                             Яиц нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="kolbasa-varenaya-vkusvill" and contains(text(),"Колбаса вареная «ВкусВилл», 400")]          Колбасы нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="kartofel" and contains(text(),"Картофель")]                                                 Картофеля нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="ogurtsy-solenye-400-g" and contains(text(),"Огурцы соленые, 400")]                          Огурцов нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="zelenyy-goroshek-bonduelle-nezhnyy-400-g" and contains(text(),"Зеленый горошек Bonduelle Нежный 400")]      Горошка нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="mayonez-provansal-sloboda-375-g" and contains(text(),"Майонез «Провансаль Слобода»,375")]   Майонеза нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="luk-zelenyy-50-g" and contains(text(),"Лук зеленый, 50")]                                   Лука нет в списке товаров в корзине
    Сhecking For Text       //a[@data-code="miks-ukrop-petrushka-50-g" and contains(text(),"Микс укроп, петрушка, 50")]                 Зелени нет в списке товаров в корзине
    Сhecking For Text       //span[@class="js-delivery__basket--totals_price" and text()="953,66"]                                      Цена в корзине отличается или не посчитана
    click element           //button[@class="js-order-btn-submit"]
    sleep                   1s
    Сhecking For Text       //div[@class="VV_Input__Error js-vv-control-error" and text()="Введите телефон"]                            Не появилась подсказка "Введите телефон"
    Сhecking For Text       //div[@class="VV_Input__Error js-vv-control-error" and text()="Укажите e-mail"]                             Не появилась подсказка "Укажите e-mail"
    Сhecking For Text       //div[@class="VV_Ordering20PayEmpty js-form-input-container js-order-payment-empty-error FormItem__error-input" and contains(text(),"Выберите способ оплаты")]      Не появилась подсказка "Выберите способ оплаты"



*** Keywords ***
Сhecking For Text
# Проверяет что текст на странице есть
   [Arguments]                     ${локатор}                   ${текст_ошибки}
   ${status}          ${value} =       Run Keyword And Ignore Error       Get Text                             ${локатор}
   Run Keyword If     '${status}' == 'FAIL'           FAIL                ${текст_ошибки}

Checking for element
# Проверка что элемент существует
   [Arguments]                     ${локатор}             ${текст_ошибки}
   ${status}          ${value} =       Run Keyword And Ignore Error       Click Element              ${локатор}
   Run Keyword If     '${status}' == 'FAIL'           FAIL                ${текст_ошибки}

Сhecking no text
# Проверяет что текста на странице нет
   [Arguments]                     ${локатор}                   ${текст_ошибки}
   ${status}          ${value} =       Run Keyword And Ignore Error       Get Text                   ${локатор}
   Run Keyword If     '${status}' == 'PASS'           FAIL                ${текст_ошибки}
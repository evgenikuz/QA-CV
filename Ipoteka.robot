*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn

*** Test Cases ***
Расчет ипотеки
    Open Browser        https://calcus.ru/kalkulyator-ipoteki       googlechrome
    set selenium speed  0.5s
    Сhecking For Text   //h1[text()="Ипотечный калькулятор"]        Открыт другой сайт или заголовок h1 изменен/отсутствует

1.Стоимость 30 млн, первоначальный взнос 10 млн, срок кредита 30 лет, процентная ставка 5%, дифференцированные
    Checking For Element    //input[@name="cost"]                                                                   Открыта вкладка "По сумме кредита"
    input text              //input[@name="cost"]                                                                   30000001
    Сhecking For Text       //span[contains(text(),"30") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    click element           //select[@name="start_sum_type"]
    click element           //option[@value="2"]
    input text              //input[@name="start_sum"]      33
    Сhecking For Text       //div[contains(text(),"9") and contains(text(),"900") and contains(text(),"000")]           Сумма первоначального взноса не рассчитана по % или выбран не %
    Сhecking For Text       //span[contains(text(),"20") and contains(text(),"100") and contains(text(),"001")]         Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text              //input[@name="period"]         30
    input text              //input[@name="percent"]        5
    click element           //label[@for="payment-type-2"]
    click element           //input[@value="Рассчитать"]
    sleep                   2s
    Checking For Element    //button[@class="btn btn-sm btn-success dropdown-toggle"]       Нет кнопки "Рассчитать ипотеку" или не произошел расчет
    Сhecking For Text       //div[@class="mb-2" and text()="График погашения"]              Нет графика погашения
    Сhecking For Text       //div[text()="139 583,34 … 56 065,97"]                                        Не рассчитан ежемесячный платеж
    Сhecking For Text       //div[text()="15 116 875,50"]                                          Не рассчитаны начисленные проценты
    Сhecking For Text       //div[text()="35 216 876,17"]                                    Не рассчитаны долг+проценты

2.Стоимость 10 млн, первоначальный взнос 9 млн, срок кредита 10 мес, процентная ставка 0.01%, аннуитетные
    reload page
    Checking For Element    //input[@name="cost"]           Открыта вкладка "По сумме кредита"
    input text              //input[@name="cost"]           10000001
    Сhecking For Text       //span[contains(text(),"10") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    input text              //input[@name="start_sum"]  9000000
    Сhecking For Text       //div[text()="(90%)"]                                                                       Процент первоначального взноса от суммы рассчитан неправильно или не рассчитан
    Сhecking For Text       //span[contains(text(),"1") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    click element           //select[@name="period_type"]
    click element           //option[@value="M"]
    input text              //input[@name="period"]     10
    input text              //input[@name="percent"]    0.01
    click element           //input[@value="Рассчитать"]
    sleep                   2s
    Checking For Element    //button[@class="btn btn-sm btn-success dropdown-toggle"]       Нет кнопки "Рассчитать ипотеку" или не произошел расчет
    Сhecking For Text       //div[@class="mb-2" and text()="График погашения"]              Нет графика погашения
    Сhecking For Text       //div[text()="100 004,68"]                                        Не рассчитан ежемесячный платеж
    Сhecking For Text       //div[text()="45,80"]                                          Не рассчитаны начисленные проценты
    Сhecking For Text       //div[text()="1 000 046,80"]                                    Не рассчитаны долг+проценты


3. Первоначальный взнос выше стоимости недвижимости.
    reload page
    input text          //input[@name="cost"]       9000001
    Сhecking For Text   //span[contains(text(),"9") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    input text          //input[@name="start_sum"]  10000000
    Сhecking For Text   //div[text()="(111.11%)"]                                                                  Процент первоначального взноса от суммы рассчитан неправильно или не рассчитан
    Сhecking For Text   //span[text()="0"]                                                                         Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text          //input[@name="period"]     10
    input text          //input[@name="percent"]    6
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="start_sum-error" and text()="Недопустимое значение"]                            Не появилась ошибка в поле "Первоначальный взнос"

4. Стоимость недвижимости равна 0.
    reload page
    input text          //input[@name="cost"]       0
    Сhecking For Text   //span[text()="0"]                                                                         Сумма кредита не соотвествует введенной
    input text          //input[@name="start_sum"]  0
    Сhecking no text    //div[text()="(100%)"]                                                                     Процент первоначального взноса расчитан, хотя сумма 0.
    Сhecking For Text   //span[text()="0"]                                                                         Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text          //input[@name="period"]     10
    input text          //input[@name="percent"]    6
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="cost-error" and text()="Обязательное поле"]                                     Не появилась ошибка в поле "Стоимость недвижимости"

5. Процент равен 0.
    reload page
    input text          //input[@name="cost"]       1000001
    Сhecking For Text   //span[contains(text(),"1") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    input text          //input[@name="start_sum"]  50000
    Сhecking For Text   //div[text()="(5%)"]                                                                       Процент первоначального взноса от суммы рассчитан неправильно или не рассчитан
    Сhecking For Text   //span[contains(text(),"950") and contains(text(),"001")]                                   Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text          //input[@name="period"]     10
    input text          //input[@name="percent"]    0
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="percent-error" and text()="Минимальное значение 0.01"]                          Не появилась ошибка в поле "Стоимость недвижимости"

6. Срок кредита 60 лет.
    reload page
    input text          //input[@name="cost"]       1000001
    Сhecking For Text   //span[contains(text(),"1") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    input text          //input[@name="start_sum"]  50000
    Сhecking For Text   //div[text()="(5%)"]                                                                       Процент первоначального взноса от суммы рассчитан неправильно или не рассчитан
    Сhecking For Text   //span[contains(text(),"950") and contains(text(),"001")]                                    Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text          //input[@name="period"]     60
    input text          //input[@name="percent"]    6
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="period-error" and text()="Максимальное значение 50"]                            Не появилась ошибка в поле "Стоимость недвижимости"

7. Отправка пустой формы.
    reload page
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="percent-error" and text()="Обязательное поле"]                          Не появилась ошибка в поле "Процентная ставка"
    Сhecking For Text   //div[@id="cost-error" and text()="Обязательное поле"]                                     Не появилась ошибка в поле "Стоимость недвижимости"
    Сhecking For Text   //div[@id="period-error" and text()="Обязательное поле"]                            Не появилась ошибка в поле "Срок кредита"

8. Процент равен 1000.
    reload page
    input text          //input[@name="cost"]       1000001
    Сhecking For Text   //span[contains(text(),"1") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    input text          //input[@name="start_sum"]  50000
    Сhecking For Text   //div[text()="(5%)"]                                                                       Процент первоначального взноса от суммы рассчитан неправильно или не рассчитан
    Сhecking For Text   //span[contains(text(),"950") and contains(text(),"001")]                                    Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text          //input[@name="period"]     10
    input text          //input[@name="percent"]    1000
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="percent-error" and text()="Максимальное значение 999"]                          Не появилась ошибка в поле "Стоимость недвижимости"

9. Срок кредита 0 лет.
    reload page
    input text          //input[@name="cost"]       1000001
    Сhecking For Text   //span[contains(text(),"1") and contains(text(),"000") and contains(text(),"001")]         Сумма кредита не соотвествует введенной
    input text          //input[@name="start_sum"]  50000
    Сhecking For Text   //div[text()="(5%)"]                                                                       Процент первоначального взноса от суммы рассчитан неправильно или не рассчитан
    Сhecking For Text   //span[contains(text(),"950") and contains(text(),"001")]                                    Сумма кредита не соотвествует разнице между введенной стоимостью и первоначальным взносом
    input text          //input[@name="period"]     0
    input text          //input[@name="percent"]    6
    click element       //input[@value="Рассчитать"]
    sleep               2s
    Сhecking For Text   //div[@id="period-error" and text()="Минимальное значение 1"]                            Не появилась ошибка в поле "Стоимость недвижимости"


10. Вкладка "По сумме кредита". Сумма 12 млн, срок кредита 10 мес, процентная ставка – 5%, дифференцированные
    reload page
    click element           //a[@data-value="2"]
    Checking for element    //input[@name="credit_sum"]         Открыта вкладка "По сумме кредита"
    input text              //input[@name="credit_sum"]         12000000
    click element           //select[@name="period_type"]
    click element           //option[@value="M"]
    input text              //input[@name="period"]             10
    input text              //input[@name="percent"]            5
    click element           //label[@for="payment-type-2"]
    click element           //input[@value="Рассчитать"]
    sleep                   2s
    Сhecking For Text       //div[@class="mb-2" and text()="График погашения"]              Нет графика погашения
    Сhecking For Text       //div[text()="1 250 000,00 … 1 205 000,00"]                                        Не рассчитан ежемесячный платеж
    Сhecking For Text       //div[text()="275 000,00"]                                          Не рассчитаны начисленные проценты
    Сhecking For Text       //div[text()="12 275 000,00"]                                    Не рассчитаны долг+проценты


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

# law_company
Simple app for law company and integration with PostgreSQL

Простое мобильное приложение для юридической фирмы с инетграцией PostgreSQL.
В базе данных содержатся пять таблиц: Клиенты, Заявления, Юристы, Услуги, Оказанные услуги.

<img width="434" height="247" alt="изображение" src="https://github.com/user-attachments/assets/44270514-6bb3-426c-a2ae-34add829c091" />

В мобильном приложении была реализована роль клиента. Для управления доступом были написаны политики RLS и VIEW (для скрытия части атрибутов). В серверной части проекта доступ к данным осуществляется исключительно через представления (VIEW).
Используется конструкция SELECT * FROM <view_name> вместо прямого обращения к таблицам.
Такой подход позволяет скрыть внутреннюю структуру базы данных, ограничить доступ к чувствительным полям и повысить уровень безопасности приложения.
Ниже приведены скриншоты мобильного приложения, демонстрирующие основные функции интерфейса:

<img width="176" height="134" alt="изображение" src="https://github.com/user-attachments/assets/f22c86c1-3360-4596-8126-afcee9c330db" />
<img width="189" height="217" alt="изображение" src="https://github.com/user-attachments/assets/23530ac4-4d5a-466c-8d7a-f7793e9761f8" />
<img width="153" height="309" alt="изображение" src="https://github.com/user-attachments/assets/4d494eac-0672-44bc-a604-42b204f9ab01" />
<img width="161" height="325" alt="изображение" src="https://github.com/user-attachments/assets/baa75b9b-c1e9-44b1-8323-ece3db6b3679" />
<img width="162" height="330" alt="изображение" src="https://github.com/user-attachments/assets/8579eaba-856e-4c0c-bdcf-46d903861645" />
<img width="155" height="315" alt="изображение" src="https://github.com/user-attachments/assets/b2970927-797c-46fe-b44c-9e959866f7f1" />
<img width="159" height="320" alt="изображение" src="https://github.com/user-attachments/assets/c0f68669-6c41-4350-94af-e2077fad853c" />







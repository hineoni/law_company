# law_company
Simple app for law company and integration with PostgreSQL

Простое мобильное приложение для юридической фирмы с инетграцией PostgreSQL.
В базе данных содержатся пять таблиц: Клиенты, Заявления, Юристы, Услуги, Оказанные услуги.

<img width="434" height="247" alt="изображение" src="https://github.com/user-attachments/assets/60511699-3ec2-4884-b896-52b4088e137b" />


В мобильном приложении была реализована роль клиента. Для управления доступом были написаны политики RLS и VIEW (для скрытия части атрибутов). В серверной части проекта доступ к данным осуществляется исключительно через представления (VIEW).
Используется конструкция SELECT * FROM <view_name> вместо прямого обращения к таблицам.
Такой подход позволяет скрыть внутреннюю структуру базы данных, ограничить доступ к чувствительным полям и повысить уровень безопасности приложения.
Ниже приведены скриншоты мобильного приложения, демонстрирующие основные функции интерфейса:

<img width="176" height="134" alt="изображение" src="https://github.com/user-attachments/assets/ffdea6be-5961-4c18-a765-c041d200a809" />
<img width="189" height="217" alt="изображение" src="https://github.com/user-attachments/assets/7025d011-d9fb-4ea6-903d-e91b5c96ac8d" />
<img width="153" height="309" alt="изображение" src="https://github.com/user-attachments/assets/b9bab91b-9236-47e4-9665-cf0415fff4ae" />
<img width="161" height="325" alt="изображение" src="https://github.com/user-attachments/assets/6784c864-64cd-4367-b296-df15b3cb0ad0" />
<img width="162" height="330" alt="изображение" src="https://github.com/user-attachments/assets/69a0a6b2-606e-485a-b71b-49be5dc3f34e" />
<img width="155" height="315" alt="изображение" src="https://github.com/user-attachments/assets/6e2695b0-cfa4-4bba-a8ac-15870d6c481a" />
<img width="159" height="320" alt="изображение" src="https://github.com/user-attachments/assets/da045a3a-a599-4365-b474-916ef13af89b" />








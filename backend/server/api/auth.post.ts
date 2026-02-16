import { defineEventHandler, readBody, createError } from 'h3'
import { createClient } from '../utils/db'

export default defineEventHandler(async (event) => {
  try {
    // Получаем данные из тела запроса
    const { login, password } = await readBody(event)
    console.log('LOGIN ATTEMPT:', login, password) // Логируем попытку входа

    if (!login || !password) {
      // Проверка на пустые значения
      console.warn('Login or password is empty')
      throw createError({
        statusCode: 400,
        statusMessage: 'Login or password cannot be empty',
      })
    }

    // Создаём подключение к PostgreSQL с переданными учетными данными
    const db = createClient(login, password)

    // Пробуем простой запрос для проверки соединения
    const result = await db.query('SELECT current_user, version()')
    console.log('Postgres connection successful:', result.rows)

    await db.end()

    // Возвращаем успешный ответ с информацией о пользователе и версии PostgreSQL
    return {
      success: true,
      current_user: result.rows[0].current_user,
      version: result.rows[0].version,
    }
  } catch (err: any) {
    // Логируем конкретную ошибку PostgreSQL
    console.error('Postgres connection failed:', err)

    // Возвращаем 401 только если проблема с логином/паролем
    const message = err.code === '28P01' ? 'Неверный логин или пароль' : 'Ошибка подключения к БД'
    throw createError({
      statusCode: 401,
      statusMessage: message,
    })
  }
})

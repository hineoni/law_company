import { defineEventHandler, createError } from 'h3'
import { createClient } from '../utils/db'

export default defineEventHandler(async (event) => {
  // Подставь сюда логин и пароль твоего тестового пользователя PostgreSQL
  const login = 'client_1'
  const password = 'test123'

  console.log('TEST DB CONNECT:', login)

  try {
    const db = createClient(login, password)

    const result = await db.query('SELECT current_user, version()')
    console.log('DB connection successful:', result.rows)

    await db.end()

    return {
      success: true,
      current_user: result.rows[0].current_user,
      version: result.rows[0].version
    }

  } catch (err) {
    console.error('DB connection failed:', err)
    throw createError({
      statusCode: 500,
      statusMessage: 'Cannot connect to PostgreSQL'
    })
  }
})

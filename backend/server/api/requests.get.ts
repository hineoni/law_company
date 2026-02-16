import { defineEventHandler, getHeader} from 'h3'
import { createClient } from '../utils/db'

export default defineEventHandler(async (event) => {
  const login = getHeader(event, 'x-login')!
  const password = getHeader(event, 'x-password')!

  const db = createClient(login, password)
  const { rows } = await db.query('SELECT * FROM client_v_requests')
  await db.end()

  return rows
})

import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();


export function createClient(login: string, password: string) {
  return new Pool({
    host: process.env.DB_HOST,          
    port: Number(process.env.DB_PORT),   
    database: process.env.DB_NAME,       
    user: login,                      
    password: password,        
  });
}

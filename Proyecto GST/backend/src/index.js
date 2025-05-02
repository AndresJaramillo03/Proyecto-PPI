import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import { getConnection } from './config/Connection.js'
import router from './routes/FormulariosRoute.js'

const app = express()
dotenv.config()

app.use(cors())
app.use(express.json())
app.use(router)

app.listen(process.env.PORT, ()=>{
    console.log(`conectados al puerto: ${process.env.PORT}`)
    getConnection
})
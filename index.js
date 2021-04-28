const express = require('express')
const path = require('path')
const dotenv = require('dotenv')

dotenv.config()

const app = express()

app.get('/', (request, response) => {
  return response.sendFile(path.resolve(__dirname + "/pages/index.html"))
})

app.listen(process.env.PORT, () => {
  console.log(`Server is online on Port ${process.env.PORT}`)
})

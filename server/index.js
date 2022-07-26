//! imports from packages
const express = require('express')
const mongoose = require('mongoose')

//! imports from other files
const authRouter = require('./routes/auth')

//! initializations
const PORT = 3000
const app = express()
const DB = 'mongodb+srv://kiishidavid:kiishi100@cluster0.xr3np.mongodb.net/?retryWrites=true&w=majority'

//! middlewares
app.use(express.json())
app.use(authRouter)

//! connections
mongoose
  .connect(DB)
  .then(() => {
    console.log('Connected to MongoDB successfully')
  })
  .catch((e) => {
    console.log(e)
  })

//! listener
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Connected @ port ${PORT}`)
})
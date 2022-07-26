const express = require('express')
const User = require('../models/user')
const bcryptjs = require('bcryptjs')
const jwt = require('jsonwebtoken')
const auth = require('../middlewares/auth')

const authRouter = express.Router()

//! SIGN UP
authRouter.post('/api/signup', async (req, res) => {
  try {
    //! 1. get data from client
    const { name, email, password, school } = req.body

    //? perform validations
    const existingUser = await User.findOne({ email })
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: 'Student with same email already exists' })
    }

    //! hash password (security)
    const hashedPassword = await bcryptjs.hash(password, 8)

    //! specify the user model
    let user = new User({
      name,
      email,
      password: hashedPassword,
      school,
    })
    user = await user.save()
    res.json(user)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
  //! 2. post data in the database
  //! 3. return data to the user
})

//! SIGN IN
authRouter.post('/api/signin', async (req, res) => {
  try {
    const { email, password } = req.body

    //! check if user exists
    const user = await User.findOne({ email })
    if (!user) {
      return res
        .status(400)
        .json({ msg: 'Student with this mail does not exist!' })
    }

    //! unhash password and compare
    const isMatch = await bcryptjs.compare(password, user.password)
    if (!isMatch) {
      return res.status(400).json({ msg: 'Incorrect password!' })
    }

    const token = jwt.sign({ id: user._id }, 'passwordKey')
    res.json({ token, ...user._doc })
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

//! API TO CHECK TOKEN VALIDITY
authRouter.post('/tokenIsValid', async (req, res) => {
  try {
    const token = req.header('x-auth-token')
    if (!token) return res.json(false)
    const verified = jwt.verify(token, 'passwordKey')
    if (!verified) return res.json(false)

    const user = await User.findById(verified.id)
    if (!user) return res.json(false)
    res.json(true)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

//! GET USER DATA
authRouter.get('/', auth, async (req, res) => {
  const user = await User.findById(req.user)
  res.json({ ...user._doc, token: req.token })
})

module.exports = authRouter

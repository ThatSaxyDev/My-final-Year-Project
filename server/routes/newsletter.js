const express = require('express')
const newsletterRouter = express.Router()
const auth = require('../middlewares/auth')
const Newsletter = require('../models/newsletter')

//! get all newsletters
newsletterRouter.get('/api/newsletters', auth, async (req, res) => {
    try {
      const newsletters = await Newsletter.find({})
      res.json(newsletters)
    } catch (e) {
      res.status(500).json({ error: e.message })
    }
  })

module.exports = newsletterRouter
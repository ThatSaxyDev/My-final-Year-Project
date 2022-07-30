const express = require('express')
const imageRouter = express.Router()
const auth = require('../middlewares/auth')
const Image = require('../models/image_upload')

//! get all images
imageRouter.get('/api/images', auth, async (req, res) => {
    try {
      const images = await Image.find({})
      res.json(images)
    } catch (e) {
      res.status(500).json({ error: e.message })
    }
  })

module.exports = imageRouter
const express = require('express')
const { model } = require('mongoose')
const admin = require('../middlewares/admin')
const Image = require('../models/image_upload')
const adminRouter = express.Router()

//! upload image
adminRouter.post('/admin/add-image', admin, async (req, res) => {
  try {
    const { image } = req.body
    let imageUp = new Image({
      image,
    })
    imageUp = await imageUp.save()
    res.json(imageUp)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

//! get all images
adminRouter.get('/admin/get-image', admin, async (req, res) => {
  try {
    const images = await Image.find({})
    res.json(images)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

//! delete images
adminRouter.post('/admin/delete-image', admin, async (req, res) => {
  try {
    const { id } = req.body
    let image = await Image.findByIdAndDelete(id)

    res.json(image)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

module.exports = adminRouter

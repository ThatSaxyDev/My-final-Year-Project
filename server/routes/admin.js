const express = require('express')
const { model } = require('mongoose')
const admin = require('../middlewares/admin')
const Image = require('../models/image_upload')
const Newsletter = require('../models/newsletter')
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

//! upload newsletters
adminRouter.post('/admin/add-newsletter', admin, async (req, res) => {
  try {
    const { newsletter } = req.body
    let newsletterUp = new Newsletter({ newsletter })
    newsletterUp = await newsletterUp.save()
    res.json(newsletterUp)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

//! get all newsletters
adminRouter.get('/admin/get-newsletter', admin, async (req, res) => {
  try {
    const newsletters = await Newsletter.find({})
    res.json(newsletters)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

//! delete newsletter
adminRouter.post('/admin/delete-newsletter', admin, async (req, res) => {
  try {
    const { id } = req.body
    let newsletter = await Newsletter.findByIdAndDelete(id)
    res.json(newsletter)
  } catch (e) {
    res.status(500).json({ error: e.message })
  }
})

module.exports = adminRouter

const mongoose = require('mongoose')

const imageSchema = mongoose.Schema({
  image: [
    {
      type: String,
      required: true,
    },
  ],
})

const Image = mongoose.model('Image', imageSchema)

module.exports = Image

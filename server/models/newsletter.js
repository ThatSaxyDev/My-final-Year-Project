const mongoose = require('mongoose')

const newsletterSchema = mongoose.Schema({
  newsletter: [
    {
      type: String,
      required: true,
    },
  ],
})

const Newsletter = mongoose.model('Newsletter', newsletterSchema)

module.exports = Newsletter

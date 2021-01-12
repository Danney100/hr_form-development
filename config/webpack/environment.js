const { environment } = require('@rails/webpacker')
const typescript =  require('./loaders/typescript')
const dotenv = require('dotenv')
const webpack = require('webpack')

const dotenvFiles = [
  `.env.${process.env.NODE_ENV}.local`,
  '.env.local',
  `.env.${process.env.NODE_ENV}`,
  '.env',
]

dotenvFiles.forEach((dotenvFile) => {
  dotenv.config({ path: dotenvFile, silent: true })
})

environment.plugins.insert(
  "Environment",
  new webpack.EnvironmentPlugin(process.env)
)

const customConfig = require('./custom')

environment.config.merge(customConfig)

environment.loaders.prepend('typescript', typescript)
module.exports = environment

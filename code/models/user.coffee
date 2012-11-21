mongoose = require 'mongoose'
Schema   = mongoose.Schema

userSchema = new Schema
  apikey: {type: String, unique: true}
  shortname: {type: String, unique: true}
  email: [String]
  displayname: String
  password: String # encrypted, duh!
  isstaff: Boolean

hash = (password) ->
  'hash-me-' + password

userSchema.methods.setPassword = (password, callback) ->
  @.password = hash password
  @.save callback

module.exports = mongoose.model 'User', userSchema

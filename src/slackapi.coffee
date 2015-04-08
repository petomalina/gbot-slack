Promise = require("promise")

Https = require('https')

module.exports = class API

  constructor: (@options) ->

  getMeta: () =>
    return new Promise (fulfill) =>
      req = Https.get "https://slack.com/api/rtm.start?token=#{@options.token}", (res) ->
        res.on "data", (data) ->
          fulfill(JSON.parse(data))

      req.end(null)
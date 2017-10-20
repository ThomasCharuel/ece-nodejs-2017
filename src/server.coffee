user = require './user.coffee'
fs = require 'fs'
url = require 'url'
pug = require 'pug'

renderResource = (filename, type, res, callback) ->
  if type == "html"
    # pug rendering
    console.log "rendering pug ressource #{filename}"
    pug.renderFile "views/index.pug",
      pretty: true,
      (err, html) -> 
        throw err if err
        res.writeHead 200,
          'Content-Type': "text/#{type}"
        res.write html
        res.end()

  else if type == "css"
    # css => stylus
    console.log "rendering resource #{filename} of type #{type}"
    fs.readFile "public/#{type}/#{filename}", (err, file) ->
      throw err if err
      res.writeHead 200,
        'Content-Type': "text/#{type}"
      res.write file
      res.end()

module.exports =
  logic: (req, res) ->
    url = url.parse req.url
    [ _, directory, filetype, filename ] = url.pathname.split "/"
    directory = "/" if directory == ""

    switch directory
      when "/"
        renderResource "index.pug", "html", res
      when "save"
        user.save "testu", "testpwd", () ->
          res.writeHead 201,
            'Content-Type': 'text/plain'
          res.end 'User is saved'
      when "get"
        console.log "/get"
        user.get "testu", () ->
          res.writeHead 200,
            'Content-Type': 'text/plain'
          res.end 'got the user'
      when "public"
        renderResource filename, filetype, res
      else
        res.writeHead 404,
          'Content-Type': 'text/plain'
        res.end 'Route not found\n'

  port: '8888'
  address: '127.0.0.1'
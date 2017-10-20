should = require 'should'
user = require '../src/user.coffee'

describe 'user', () ->
  it 'saves properly', (done) ->
    user.save "ok", "pwd", (err) ->
      should.not.exist err
      done()

  it 'doesn\'t save because missing parameters', (done) ->
    user.save "only name", (err) ->
      should.exist err
      done()

  it 'gets properly', (done) ->
    user.get "userTest", (err) ->
      should.not.exist err
      done()
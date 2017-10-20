module.exports = 
  # Save the user
  # Usage: save(name, pwd, callback)
  # - Name = user name
  # - Pwd = password
  # - Callback = function to call when done
  save: (name, pwd, callback) ->
    if !callback
      callback = pwd
      callback new Error "missing parameters"
    else
      # console.log("saving " + name + " with pwd " + pwd);
      callback()

  get: (name, callback) ->
    # console.log("getting " + name);
    callback()
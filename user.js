module.exports = {
  save: function(name, pwd, callback) {
    console.log("saving " + name + " with pwd " + pwd);
    callback();
  },
  get: function(name, callback) {
    console.log("saving " + name);
    callback();
  }
}
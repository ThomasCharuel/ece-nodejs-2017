module.exports = {
  save: function(name, pwd, callback) {
    if(callback == null){
      pwd(new Error("missing parameters callback"));
    }
    else{
      console.log("saving " + name + " with pwd " + pwd);
      callback();
    }
  },
  get: function(name, callback) {
    console.log("getting " + name);
    callback();
  }
}
var user = require('./user.js');

module.exports = {
  logic: function(req, res){
    console.log(req.url);
    if(req.url == '/save') {
      user.save('testUser', 'testPwd', function(){
        // Write a response header
        res.writeHead(200, {'Content-Type': 'text/plain' });
        
        // Write a response content
        res.end('User is saved\n');
      });
    } else if(req.url == '/get') {
      user.get('test', function(){
        // Write a response header
        res.writeHead(200, {'Content-Type': 'text/plain' });
        
        // Write a response content
        res.end('Got the user\n');
      });
    } else if(req.url == '/'){
      console.log("hello i'm a function");
      
      // Write a response header
      res.writeHead(200, {'Content-Type': 'text/plain' });
  
      // Write a response content
      res.end('Hello World\n');
    } else {
      // Write a response header
      res.writeHead(404, {'Content-Type': 'text/plain' });
      
      // Write a response content
      res.end('Route not found\n');
    }

    //start the server
  },
  port: '8888',
  address: '127.0.0.1'
}
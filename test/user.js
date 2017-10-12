var should = require('should');
var user = require('../src/user');

describe('user', function(){
  it('save properly', function(){
    
    user.save("ok", "pwd", function(err){
      should.not.exist(err);
      done();
    });
    
    done();
  });

  it('doesn\'t save because missing parameters', function(){
    user.save("only name", function(err){
      should.exist(err);
      done();
    });
  });

  it('get', function(){
    // ...
    
    done();
  });
})
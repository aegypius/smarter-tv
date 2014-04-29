var expect  = require('chai').expect
  , request = require('superagent')
  , PORT    = process.env.PORT || 3000;

describe('Backend', function () {

    var backend = require('../core'),
        instance;

    before(function() {
        instance     = backend.listen(PORT);
        instance.url = 'http://127.0.0.1:' + PORT;
    });

    describe('/profile (Profile API)', function () {

        it('should create a new profile without error', function (done) {
            request
                .put(instance.url + '/profile')
                .send({ firstname: 'James', lastname: 'Bond'})
                .end(function (err, res) {
                    expect(err).to.be.null;
                    expect(res.statusCode).to.equal(201);
                    done();
                })
            ;
        });

        it('should read profile without error', function (done) {
            request
                .get(instance.url + '/profile/1')
                .end(function (err, res) {
                    expect(err).to.be.null;
                    expect(res.statusCode).to.equal(202);
                    done();
                })
            ;
        });

        it('should update a profile without error', function (done) {
            request
                .put(instance.url + '/profile/1')
                .send({firstname: 'Julius', lastname: 'No'})
                .end(function (err, res) {
                   expect(err).to.be.null;
                   expect(res.statusCode).to.equal(202);
                   done();
                })
            ;
        });

        it('should delete a profile without error', function (done) {
            request
                .del(instance.url + '/profile/1')
                .end(function (err, res) {
                    expect(err).to.be.null;
                    expect(res.statusCode).to.equal(202);
                    done();
                })
            ;
        });

    });

    after(function () {
        instance.close();
    });

});

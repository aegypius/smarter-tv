describe "Signup", ->

  it "should display signup form when navigating to /signup", (done)->
    request(app)
      .get "/signup"
      .expect "Content-Type", /html/
      .expect 200
      .end done

  it "should be able to register new user", (done)->
    request(app)
      .post "/profile"
      .send { name: "John Doe", password: "password" }
      .expect 201
      .end done

#Rspec Rails Lesson

This app already has rspec installed.  If you're starting a new app, here are the steps you'll need to follow:

`gem rspec-rails` in your gemfile

`rails g rspec:install`

`rspec` to run tests`

To test AJAX requests/JSON responses:

```ruby
@expected = { 
  :flashcard  => @flashcard,
  :lesson     => @lesson,
  :success    => true
}.to_json

xhr :get, :index

response.body.should == @expected
```
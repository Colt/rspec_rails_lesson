describe "Todos Management" do 

  describe 'creating a new todo' do
    it 'renders a form and creates a new todo' do
      get "/todos/new"
      expect(response).to render_template(:new)

      post "/todos", :todo => {:title => "My Todo", description: "Do Things"}

      expect(response).to redirect_to(assigns(:todo))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("My Todo")
    end
  end

end

# rails g rspec:install
# @expected = { 
#         :flashcard  => @flashcard,
#         :lesson     => @lesson,
#         :success    => true
# }.to_json
# xhr :get, :index
# response.body.should == @expected


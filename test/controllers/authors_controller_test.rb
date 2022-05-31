class AuthorsControllerTest < ActionDispatch::IntegrationTest
 test "show" do
       author = authors(:one)
       get author_path(author.id)
      assert_response :success
   end
   test "new" do 
    get new_author_path
    assert_response :success
   end
   test "create" do 
    library = libraries(:library_one)
    post "/authors",
    params: { author: {name: "new author", email: "a@test" , library_id: library.id} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    author = Author.last
    assert_equal author.name, "new author"
   end
   test "edit" do 
    author = authors(:one)
   get edit_author_path(author.id)
   assert_response :success
   end
   test "update"  do
    library = libraries(:library_one)
    author = Author.create(name: "author", email: "a@a", library_id: library.id)
    put "/authors/#{author.id}",
    params: { author: {name: "author edited", email: "a@test" , library_id: library.id} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    author = Author.last
    assert_equal author.name, "author edited"
   end
   test "delete" do
    library = libraries(:library_one)
    author = Author.create(name: "felipe", email: "a@a", library_id: library.id)
    delete  "/authors/#{author.id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
   end
end    
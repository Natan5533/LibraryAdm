require "test_helper"

class LibraryTest < ActiveSupport::TestCase
  test "create library" do
   library = Library.new(name: "kalunga", address: "Rua pinheiro")

    assert_equal library.save, true
    assert_equal Library.find(library.id).name, "kalunga"
    assert_equal Library.find(library.id).address, "Rua pinheiro"
  end
  test "library has many authors" do
    library = Library.create(name: "kalunga", address: "Rua pinheiro")
    author1 = Author.create(name: "Jorge", email: "jorge@gmail", library_id: library.id)
    author2 = Author.create(name: "Matheus", email: "Matheus@gmail", library_id: library.id)
    authors = [author1, author2]

    assert_equal library.authors,  authors
  end 
 
  test "empty name error" do
    library = Library.create(address: "Rua pinheiro")
    #require 'pry';  binding.pry
   
   # assert_equal library, false
   assert library.errors.details == {:name=>[{:error=>:blank}]}
  end
  test "empty address error" do
    library = Library.create(name: "Library")

    assert library.errors.details == {:address=>[{:error=>:blank}]}
  end
end

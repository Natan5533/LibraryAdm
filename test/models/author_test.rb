require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "create author" do
    library = Library.create(name: "TestLibrary", address: "av test")
    author = Author.new(name: "Flavio", email: "test@test", library_id: library.id)
    assert_equal author.save, true
    assert_equal Author.find(author.id).name, "Flavio"
    assert_equal Author.find(author.id).email, "test@test"
  end
  test "author has many Books" do 
    library = Library.create(name: "TestLibrary", address: "av test")
    author = Author.create(name: "Flavio", email: "test@test", library_id: library.id)
    book1 = Book.create(title: "book1", author_id: author.id, library_id: library.id)
    book2 = Book.create(title: "book2", author_id: author.id, library_id: library.id)
    books = [book1, book2]
    assert_equal author.books, books
  end 
  test "one author belongs to one library" do 
     library = Library.create(id: 500, name: "library1", address: "test1")
     author = Author.create(name: "Author", email: "b@b", library_id: library.id)
     assert_equal author.library.id, library.id
   end
end

#Author has many books && belong to Library

require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "create book" do 
    library = Library.create(name: "library", address: "avenida")
    author = Author.create(name: "author", email: "a@a", library_id: library.id)
    book = Book.new(title: "titulo", author_id: author.id,)
   
    assert_equal book.save, true
    assert_equal Book.find(book.id).title, "titulo"
  end
  test "Books belongs to one author" do
    library = Library.create(id: 500, name: "library1", address: "test1")
    author = Author.create(name: "Author", email: "b@b", library_id: library.id)
    book = Book.new(title: "titulo", author_id: author.id,)

    assert_equal book.author.id, author.id
  end
end

require 'rails_helper'

describe Author, type: :model do
    context "test the model author" do
        it "create a new author" do
            library = Library.create(name: "kalunga", address: "Rua pinheiro")
            author = Author.new(name: "author", email: "a@a", library_id: library.id)

            expect(author.save).to eql(true)
        end
        it "check the values created" do 
            library = Library.create(name: "kalunga", address: "Rua pinheiro")
            author = Author.create(name: "author", email: "a@a", library_id: library.id)

            expect(Author.find(author.id).name).to eql("author")
            expect(Author.find(author.id).email).to eql("a@a")
        end
    end
    context "author associations" do
        it "author has many books" do
            library = Library.create(name: "TestLibrary", address: "av test")
            author = Author.create(name: "Flavio", email: "test@test", library_id: library.id)
            book1 = Book.create(title: "book1", author_id: author.id,)
            book2 = Book.create(title: "book2", author_id: author.id,)
            books = [book1, book2]

            expect(author.books.count).to eql(books.count)
        end
        it "one author belongs to one library" do
            library = Library.create(id: 500, name: "library1", address: "test1")
            author = Author.create(name: "Author", email: "b@b", library_id: library.id)

            expect(author.library.id).to eql(library.id)
        end
    end
end
require 'rails_helper'

describe Author, type: :model do
    context "test the model book" do
        it "create a new book" do
            library = Library.create(name: "library", address: "avenida")
            author = Author.create(name: "author", email: "a@a", library_id: library.id)
            book = Book.new(title: "titulo", author_id: author.id)

            expect(book.save).to eql(true)
        end
        it "check the values created" do 
            library = Library.create(name: "library", address: "avenida")
            author = Author.create(name: "author", email: "a@a", library_id: library.id)
            book = Book.create(title: "title", author_id: author.id)

            expect(Book.find(book.id).title).to eql("title")
        end
        context "book associations" do
            it "books belongs to one author" do
                library = Library.create(name: "library", address: "avenida")
                author = Author.create(name: "author", email: "a@a", library_id: library.id)
                book = Book.create(title: "title", author_id: author.id)

                expect(book.author.id).to eql(author.id)
            end
        end
    end
end

        
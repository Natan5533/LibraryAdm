require 'rails_helper'

describe Library, type: :model do
  context 'test the model library' do
    it 'create a new library' do
      library = Library.new(name: 'kalunga', address: 'Rua pinheiro')

      expect(library.save).to eql(true)
    end
    it 'check the values created' do
      library = Library.create(name: 'kalunga', address: 'Rua pinheiro')

      expect(Library.find(library.id).name).to eql('kalunga')
      expect(Library.find(library.id).address).to eql('Rua pinheiro')
    end
  end
  context 'library associations' do
    it 'library has many authors' do
      library = Library.create(name: 'kalunga', address: 'Rua pinheiro')
      author1 = Author.create(name: 'author one', email: 'a@gmail', library_id: library.id)
      author2 = Author.create(name: 'author two', email: 'b@gmail', library_id: library.id)
      authors = [author1, author2]

      expect(library.authors.count).to eql(authors.count)
    end
  end
end

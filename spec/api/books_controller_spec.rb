require 'rails_helper'

def getbooksformated(book)
  ActiveModelSerializers::SerializableResource.new(book, { serializer: BookSerializer }).as_json
end

def createnewbook
  create :book, :regular_book
end

describe Api::BooksController, type: :controller do
  context 'GET index' do
    it 'return all books' do
      book1 = createnewbook
      book2 = createnewbook

      formated_book1  = getbooksformated(book1)
      formated_book2  = getbooksformated(book2)
      expected_body = [formated_book1, formated_book2]

      get :index

      expect(response).to have_http_status(:success)
      expect(response.body).to eql(expected_body.to_json)
    end
    it 'filter books based on parameter' do
      book = createnewbook
      formated_book = getbooksformated(book)
      expected_body = [formated_book]

      get :index, params: {
        title: 'First'
      }
      expect(response).to have_http_status(:success)
      expect(response.body).to eql(expected_body.to_json)
    end
  end
  context 'GET show' do
    it 'return the book' do
      book = createnewbook

      get :show, params: {
        id: book.id
      }
      expect(response).to have_http_status(:success)
    end
    it 'id not found' do
      get :show, params: {
        id: 0o10101
      }
      expect(response).to have_http_status(400)
      expect(response.body).to eql('id invalida')
    end
  end
  context 'POST create' do
    it 'create new book' do
      library = Library.create(name: 'chico', address: 'rua 1')
      author = Author.create(name: 'chiquin', email: 'faca@a', library_id: library.id)
      book_params = { book: { title: 'book one', author_id: author.id } }

      expect { post :create, params: book_params }.to change(Book, :count).by(1)
      expect(response).to have_http_status(:success)
    end
    it 'returns error when attributes are empty' do
      library = Library.create(name: 'library', address: '1º avenue')
      author = Author.create(name: 'Monteiro', email: 'mont@lobato', library_id: library.id)
      book_params = { book: { title: nil, author_id: author.id } }
      expected_body = { title: ["can't be blank"] }

      post :create, params: book_params

      expect(response).to have_http_status(:ok)
      expect(response.body).to eql(expected_body.to_json)
    end
  end
  context 'PUT update' do
    it 'update the author' do
      book = createnewbook

      put :update, params: {
        id: book.id, book: {
          title: 'titulo correto'
        }
      }
      expect(response).to have_http_status(:success)
    end
    it 'returns error when attributes are empty' do
      library = Library.create(name: 'library', address: '1º avenue')
      author = Author.create(name: 'Monteiro', email: 'mont@lobato', library_id: library.id)
      book = Book.create(title: 'title 1', author_id: author.id)
      expected_body = { title: ["can't be blank"] }

      put :update, params: {
        id: book.id, book: {
          title: nil
        }
      }

      expect(response).to have_http_status(:ok)
      expect(response.body).to eql(expected_body.to_json)
    end
  end
  context 'DELETE destroy' do
    it 'delete the author' do
      book = createnewbook

      delete :destroy, params: {
        id: book.id
      }

      expect(response).to have_http_status(:success)
    end
  end
end

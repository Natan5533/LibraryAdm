require 'rails_helper'

describe BooksController, type: :controller do
  context 'GET index' do
    it 'return all books' do
      library = Library.create(name: 'library', address: 'rua 1')
      author = Author.create(name: 'author', email: 'a@a', library_id: library.id)
      book = Book.create(title: 'title 1', author_id: author.id)
      book2 = Book.create(title: 'title 2', author_id: author.id)

      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end
  context 'GET show' do
    it 'return the book' do
      library = Library.create(name: 'library', address: 'rua 1')
      author = Author.create(name: 'author', email: 'a@a', library_id: library.id)
      book = Book.create(title: 'title 1', author_id: author.id)

      get :show, params: {
        id: book.id
      }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
  context 'GET new' do
    it 'return view new' do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end
  context 'POST create' do
    it 'create new book' do
      library = Library.create(name: 'library', address: 'rua 1')
      author = Author.create(name: 'author', email: 'a@a', library_id: library.id)

      post :create, params: {
        book: {
          title: 'book one',
          author_id: author.id
        }
      }
      expect(response).to have_http_status(:redirect)
      expect(response).to have_http_status(:found)
    end
  end
  context 'GET edit' do
    it 'return edit view' do
      library = Library.create(name: 'library', address: 'rua 1')
      author = Author.create(name: 'author', email: 'a@a', library_id: library.id)
      book = Book.create(title: 'title 1', author_id: author.id)

      get :edit, params: {
        id: book.id
      }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end
  context 'PUT update' do
    it 'update the book' do
      library = Library.create(name: 'library', address: 'rua 1')
      author = Author.create(name: 'author', email: 'a@a', library_id: library.id)
      book = Book.create(title: 'ERROR', author_id: author.id)

      put :update, params: {
        id: book.id, book: {
          title: 'book two'
        }
      }
      expect(response).to have_http_status(:redirect)
      expect(response).to have_http_status(:found)
    end
  end
  context 'DELETE destroy' do
    it 'delete the book' do
      library = Library.create(name: 'library', address: 'rua 1')
      author = Author.create(name: 'author', email: 'a@a', library_id: library.id)
      book = Book.create(title: 'ERROR', author_id: author.id)

      delete :destroy, params: {
        id: book.id
      }
      expect(response).to have_http_status(:redirect)
      expect(response).to have_http_status(:found)
    end
  end
end

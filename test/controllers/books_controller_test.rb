class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'show' do
    book = books(:one)
    get book_path(book.id)
    assert_response :success
  end
  test 'new' do
    get new_book_path
    assert_response :success
  end
  test 'create' do
    author = authors(:author_two)
    post '/books',
         params: { book: { title: 'Livro', author_id: author.id } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    book = Book.last
    assert_equal book.title, 'Livro'
  end
  test 'edit' do
    book = books(:one)
    get edit_book_path(book.id)
    assert_response :success
  end
  test 'update' do
    book = books(:one)
    put book_path(book.id), params: { book: { title: 'Edited Book' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    book = Book.find(book.id)
    assert_equal book.title, 'Edited Book'
  end
  test 'delete' do
    book = books(:one)
    delete "/books/#{book.id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end

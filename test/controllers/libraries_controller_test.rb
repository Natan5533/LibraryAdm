class LibrariesControllerTest < ActionDispatch::IntegrationTest
  # test "index" do
  # get libraries_path
  # assert_response 200
  # end

  test 'show' do
    library = libraries(:library_one)
    get library_path(library.id)
    assert_response :success
  end
  test 'new' do
    get new_library_path
    assert_response :success
  end
  test 'create' do
    post '/libraries',
         params: { library: { name: 'amazon', address: 'rua sla' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    library = Library.last
    assert_equal library.name, 'amazon'
  end
  test 'edit ' do
    library = libraries(:library_one)
    get edit_library_path(library.id)
    assert_response :success
  end
  test 'update' do
    library = Library.create(name: 'amazon', address: 'rua gripino')
    put "/libraries/#{library.id}",
        params: { library: { name: 'Novo nome', address: 'rua gripino' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    library = Library.last
    assert_equal library.name, 'Novo nome'
  end
  test 'delete' do
    library = Library.create(name: 'Delete', address: 'rua test')
    delete "/libraries/#{library.id}"
    assert_response :redirect

    follow_redirect!
    assert_response :success
  end
  # testes de falha --
end

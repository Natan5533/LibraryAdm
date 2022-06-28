require 'json'
class LibrariesControllerTest < ActionDispatch::IntegrationTest
  test 'Index' do
    Library.create(name: 'livraria', address: 'rua 1')
    Library.create(name: 'livraria2', address: 'rua 2')
    Library.create(name: 'livraria3', address: 'rua 3')
    get '/api/libraries'
    assert_response :success
    assert_equal JSON.parse(response.body),
                 [
                   { 'id' => 166_825_044, 'name' => 'Kalunga', 'address' => 'rua 1', 'created_at' => '2022-05-31T16:56:39.653Z',
                     'updated_at' => '2022-05-31T16:56:39.653Z' }, { 'id' => 298_486_374, 'name' => 'MyString', 'address' => 'MyString', 'created_at' => '2022-05-31T16:56:39.653Z', 'updated_at' => '2022-05-31T16:56:39.653Z' }, { 'id' => 298_486_375, 'name' => 'livraria', 'address' => 'rua 1', 'created_at' => '2022-05-31T16:56:40.891Z', 'updated_at' => '2022-05-31T16:56:40.891Z' }, { 'id' => 298_486_376, 'name' => 'livraria2', 'address' => 'rua 2', 'created_at' => '2022-05-31T16:56:40.895Z', 'updated_at' => '2022-05-31T16:56:40.895Z' }, { 'id' => 298_486_377, 'name' => 'livraria3', 'address' => 'rua 3', 'created_at' => '2022-05-31T16:56:40.896Z', 'updated_at' => '2022-05-31T16:56:40.896Z' }
                 ]
  end
  test 'Show' do
    library = libraries(:library_one)
    get api_library_path(library.id)
    assert_response :success
  end
end

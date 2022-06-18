require 'rails_helper'

def getauthorsformated(author)
    ActiveModelSerializers::SerializableResource.new(author, {serializer: AuthorSerializer}).as_json
end
def createauthor
    create :author , :regular_author
end

describe Api::AuthorsController, type: :controller do
    context "GET index" do
        it "return all authors" do
            author1 = createauthor
            author2 = createauthor
            formated_author1  = getauthorsformated(author1)
            formated_author2  = getauthorsformated(author2)
            expected_body = [formated_author1,formated_author2]

            get :index
            expect(response).to have_http_status(:success)
            expect(response.body).to eql(expected_body.to_json)
        end
        it "filter authors based on parameter" do
            author1 = createauthor
            formated_author1  = getauthorsformated(author1)
            expected_body = [formated_author1]
    
            get :index, params:{
                name: "Flavio"
            }  
            expect(response).to have_http_status(:success)
            expect(response.body).to eql(expected_body.to_json)
        end
    end
    context "GET show" do
        it "return the author" do
            author = createauthor

            get :show, params:{
                id: author.id
            }
            expect(response).to have_http_status(:success)
        end
    end
    context "POST create" do
        it "create new author" do
            library = Library.create(name: "kalunga", address: "1º avenue")
            author_params = {author: {name: "author one", email: "ilovejesus123@gm.com", library_id: library.id}}

           
            expect { post :create, params: author_params }.to change(Author, :count).by(1)
            expect(response).to have_http_status(:success)
        end
        it "returns error when attributes are empty" do
            library = Library.create(name: "library", address: "1º avenue")
            author_params = {author: {name: nil, email: nil, library_id: library.id}}
            expected_body = {name: ["can't be blank"],email: ["can't be blank"]}

            post :create, params: author_params

            expect(response).to have_http_status(:internal_server_error)
            expect(response.body).to eql(expected_body.to_json)
        end
    end
    context "PUT update" do
        it "update the author" do
            author = createauthor


            put :update, params:{
                id: author.id, author:{
                    name: "newflavio"
                }
            }

            expect(response).to have_http_status(:success)    
        end
        it "returns error when attributes are empty" do
            library = Library.create(name: "library", address: "1º avenue")
            author = Author.create(name: "eu", email: "mont@lobato", library_id: library.id )
            expected_body = {name: ["can't be blank"],email: ["can't be blank"]}

            put :update, params:{
                id: author.id, author:{
                    name: nil,
                    email: nil
                }}

            expect(response).to have_http_status(:internal_server_error)
            expect(response.body).to eql(expected_body.to_json)
        end
    end
    context "DELETE destroy" do
        it "delete the author" do
            author = createauthor

            delete :destroy, params:{
                id: author.id
            }
        end
    end
end
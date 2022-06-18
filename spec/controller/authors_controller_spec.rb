require 'rails_helper'

describe AuthorsController, type: :controller do
    context "GET index" do
        it "returns all authors" do 
         library =  Library.create(name: "library 1", address: "rua 1")
            Author.create(name: "author 1", email: "a@a", library_id: library.id)
            Author.create(name: "author 2", email: "a@a", library_id: library.id)
            get :index

            expect(response).to have_http_status(:success)
            expect(response).to render_template(:index)
        end
    end
    context "GET show" do 
        it "return author" do
        library =  Library.create(name: "library 1", address: "rua 1")
           author =  Author.create(name: "author 1", email: "a@a", library_id: library.id)
            get :show, params: { 
                id: author.id
              }
              expect(response).to have_http_status(:success)
              expect(response).to render_template(:show)
            end
    end
    context "GET new" do
        it "return view new" do
            get :new 
            expect(response).to have_http_status(:success)
        end
    end
    context "POST create" do 
        it "create new author" do
            library = Library.create(name: "library 1", address: "rua 1")
            post :create, params: {
                author: {
                    name: "author",
                    email: "a@a",
                    library_id: library.id
                }}
                expect(response).to have_http_status(:redirect)
                expect(response).to have_http_status(:found)
        end
    end
    context "GET edit" do
        it "return edit view" do
            library =  Library.create(name: "library 1", address: "rua 1")
           author =  Author.create(name: "author 1", email: "a@a", library_id: library.id)
           get :edit, params:{
               id: author.id
           }
           expect(response).to have_http_status(:success)
           expect(response).to render_template(:edit)
        end
    end
    context "PUT update" do
        it "update the author" do
            library =  Library.create(name: "library 1", address: "rua 1")
           author =  Author.create(name: "error", email: "a@a", library_id: library.id)
            get :update, params:{
                id: author.id, author: {
                  name: "author"
                }
            }
            expect(response).to have_http_status(:redirect)
            #expect(Library.find(author.id).name).to eql("author")
        end
    end
    context "DELETE author" do
        it "Delete the author" do
            library =  Library.create(name: "library 1", address: "rua 1")
           author =  Author.create(name: "author", email: "a@a", library_id: library.id)
           get :destroy, params:{
            id: author.id
        }
        expect(response).to have_http_status(:redirect)
        expect(response).to have_http_status(:found)
        end
    end
end
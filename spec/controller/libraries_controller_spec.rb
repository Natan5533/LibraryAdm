require 'rails_helper'


describe LibrariesController, type: :controller do
        context "GET index" do 
            it "returns all libraries" do
                Library.create(name: "library 1", address: "rua 1")
                Library.create(name: "library 2", address: "rua 2")
                get :index
               # require 'pry';  binding.pry

                expect(response).to have_http_status(:success)
                expect(response).to render_template(:index)
            end
        end
        context "GET show" do 
            it "return library" do  
               library = Library.create(name: "library 1", address: "rua 1")

               get :show, params: { 
                   id: library.id
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
            it "create new library" do
                library_params = {library: {name: "library 1", address: "avenue"}}

           
                expect {  post :create, params: library_params }.to change(Library, :count).by(1)
                expect(response).to redirect_to library_path(Library.last)
            end
        end
        context "GET edit" do 
            it "return view edit" do
                library =  Library.create(name: "library", address: "rua 1")
            get :edit, params: {
                id: library.id
            }
            expect(response).to have_http_status(:success)
            expect(response).to render_template(:edit)
        end
        end
        context "PUT update" do
            it "update the library" do
                library =  Library.create(name: "libreeeee", address: "rua 1")
                put :update, params: { id: library.id, library: {name: "library"}}
               # params: {library: {name: "library"}}    //// Essa forma passou no teste **
                expect(response).to have_http_status(:redirect)
            end
        end
        context "DELETE route" do
            it "Delete the library" do
                library =  Library.create(name: "library", address: "rua 1")
                put :destroy, params: {
                    id: library.id
                }
                expect(response).to have_http_status(:redirect)
                expect(response).to have_http_status(:found)
                #expect(Library.find(library.id)).to exist(false)
            end
        end
end
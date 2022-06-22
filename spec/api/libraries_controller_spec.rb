require 'rails_helper'

def getlibraryformated(lib)
 ActiveModelSerializers::SerializableResource.new(lib, {serializer: LibrarySerializer}).as_json
end

def createlibrary
    create :library , :regular_library
end


describe Api::LibrariesController, type: :controller do
    context "GET index" do
        it "return all libraries" do
           lib1 = createlibrary
           lib2 = createlibrary

        
            formated_library1  = getlibraryformated(lib1)
            formated_library2  = getlibraryformated(lib2)
             expected_body = [formated_library1, formated_library2]

            get :index
            expect(response).to have_http_status(:success)
            expect(response.body).to eql(expected_body.to_json)
        
        end
        it "filter libraries based on parameter" do
            library = createlibrary
            formated_library1  = getlibraryformated(library)
            expected_body =  [formated_library1]

            get :index, params:{
                name: "Banca"
            }  
            expect(response).to have_http_status(:success)
            expect(response.body).to eql(expected_body.to_json)

            
        end
    end

    context "GET show" do
        it "return the library" do
            library = createlibrary

            get :show, params:{
                id: library.id
            }
            expect(response).to have_http_status(:success)
        end
    end
    context "POST create" do
        it "create new library" do
            library_params = {library: {name: "Kalunguinha", address: "avenue"}}
            expected_body =  {"id" => 1, "name" => "Kalunguinha", "address" => "avenue"}
            require 'pry';  binding.pry

            expect {  post :create, params: library_params }.to change(Library, :count).by(1)
            require 'pry';  binding.pry
            expect(response).to have_http_status(:success)

            library = JSON.parse(response.body)
            expect(library).to include(expected_body)
        end
        it "returns error when attributes are empty" do
            library_params = {library: {name: nil, address: nil}}
            expected_body = {name: ["can't be blank"],address: ["can't be blank"]}

            post :create, params: library_params

            expect(response).to have_http_status(:internal_server_error)
            expect(response.body).to eql(expected_body.to_json)
        end
    end
    context "PUT update" do
        it "update the library" do
            library = createlibrary
            put :update, params:{
                id: library.id, library:{
                name: "Kalunguinha"
            }}
            expect(response).to have_http_status(:success)
            require 'pry';  binding.pry
        end
        it "returns error when attributes are empty" do
            library = Library.create(name: "ERROR", address: "1º avenue")
            expected_body = {name: ["can't be blank"],address: ["can't be blank"]}

            put :update, params:{
                id: library.id, library:{
                    name: nil,
                    address: nil
                }}

            expect(response).to have_http_status(:success)
            expect(response.body).to eql(expected_body.to_json)
        end
    end
    context "DELETE destroy" do
        it "delete the library" do
            library = createlibrary
            delete :destroy, params:{
                id: library.id
            }
            expect(response).to have_http_status(:success)
            require 'pry';  binding.pry
        end
    end
end
RSpec.describe ErrorsController, type: :controller do
    # error 403, 404, 422, 500, ie_warning
    describe "GET #error_403" do
        it "returns http success" do
            get :error_403
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #error_404" do
        it "returns http success" do
            get :error_404
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #error_422" do
        it "returns http success" do
            get :error_422
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #error_500" do
        it "returns http success" do
            get :error_500
            expect(response).to have_http_status(:success)
        end
    end
    describe "GET #ie_warning" do
        it "returns http success" do
            get :ie_warning
            expect(response).to have_http_status(:success)
        end
    end
end
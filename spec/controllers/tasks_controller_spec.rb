# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:valid_attributes) {
    { title: 'Task Title' }
  }

  let(:invalid_attributes) {
    { title: '' }
  }

  let(:task) {
    create(:task)
  }

  describe "GET #index" do
    it "returns a success response" do
      task
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      task
      get :show, params: { id: task.to_param }, format: :json
      expect(response).to be_successful
    end

    it "returns a not found" do
      get :show, params: { id: 2 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { task: valid_attributes }, format: :json
        }.to change(Task, :count).by(1)
      end

      it "renders a JSON response with the new task" do
        post :create, params: { task: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new task" do
        post :create, params: { task: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'New Task Title' }
      }

      it "updates the requested task" do
        task
        put :update, params: { id: task.to_param, task: new_attributes }, format: :json
        task.reload
        expect(task.title).to eq('New Task Title')
      end

      it "renders a JSON response with the task" do
        task
        put :update, params: { id: task.to_param, task: valid_attributes }, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the task" do
        task
        put :update, params: { id: task.to_param, task: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task
      expect {
        delete :destroy, params: { id: task.to_param }, format: :json
      }.to change(Task, :count).by(-1)
    end

    it "returns a success response" do
      task
      delete :destroy, params: { id: task.to_param }, format: :json
      expect(response).to have_http_status(:no_content)
    end

    context 'having an error on destroy' do
      it 'not destroys the user' do
        allow_any_instance_of(Task).to receive(:destroy).and_return(false)
        task
        expect do
          delete :destroy, params: { id: task.id }
        end.to change(Task, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

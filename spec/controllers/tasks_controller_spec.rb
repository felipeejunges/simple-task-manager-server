# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:valid_attributes) {
    { task: { title: 'Task Title' } }
  }

  let(:invalid_attributes) {
    { task: { title: '' } }
  }

  describe "GET #index" do
    it "returns a success response" do
      task = Task.create!(title: 'Task Title')
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      task = Task.create!(title: 'Task Title')
      get :show, params: { id: task.to_param }, format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: valid_attributes, format: :json
        }.to change(Task, :count).by(1)
      end

      it "renders a JSON response with the new task" do
        post :create, params: valid_attributes, format: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new task" do
        post :create, params: invalid_attributes, format: :json
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
        task = Task.create!(title: 'Task Title')
        put :update, params: { id: task.to_param, task: new_attributes }, format: :json
        task.reload
        expect(task.title).to eq('New Task Title')
      end

      it "renders a JSON response with the task" do
        task = Task.create!(title: 'Task Title')
        put :update, params: { id: task.to_param, task: valid_attributes }, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the task" do
        task = Task.create!(title: 'Task Title')
        put :update, params: { id: task.to_param, task: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = Task.create!(title: 'Task Title')
      expect {
        delete :destroy, params: { id: task.to_param }, format: :json
      }.to change(Task, :count).by(-1)
    end

    it "returns a success response" do
      task = Task.create!(title: 'Task Title')
      delete :destroy, params: { id: task.to_param }, format: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end

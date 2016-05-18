require 'rails_helper'

describe StudentsController, :type => :controller do
  let!(:student) { FactoryGirl.create(:student) }
  
  describe '#new' do
    before { get :new }

    context 'renders' do
      render_views
      it { expect(response).to render_template(:new) }
    end
  end

  describe '#create' do
    it "creates a new student" do
      expect{
        post :create, student: FactoryGirl.attributes_for(:student)
      }.to change(Student,:count).by(1)
    end
  end

  describe '#edit' do
    before { get :edit, id: student.id }

    context 'render_views' do
      render_views
      it { expect(response).to render_template(:edit) }
    end
  end

  describe '#update' do
    before :each do
      @student = FactoryGirl.create(:student)
    end
  
    context "valid attributes" do
      it "changes @student's attributes" do
        put :update, id: @student, 
          student: FactoryGirl.attributes_for(:student, name: "Matheus")
        @student.reload
        @student.name.should eq("Matheus")
      end
    end
  end

  describe '#show' do
    before { get :show, id: student.id }

    describe 'renders' do
      render_views
      it { expect(response).to render_template(:show) }
    end
  end

  describe '#index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

  describe '#destroy' do
    let!(:student_delete) { FactoryGirl.create(:student) }
    subject(:do_destroy) { delete :destroy, id: student_delete  }

    it { is_expected.to redirect_to action: :index }

    it "deletes the student" do
      expect{
        delete :destroy, id: student_delete        
      }.to change(Student,:count).by(-1)
      
    end
  end
end

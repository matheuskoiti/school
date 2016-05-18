require 'rails_helper'

describe StudentsController, :type => :controller do
  let(:student) { FactoryGirl.create(:student) }
  
  describe '#new' do
    before { get :new }

    context 'renders' do
      render_views
      it { expect(response).to render_template(:new) }
    end
  end

  describe '#edit' do
    before { get :edit, id: student.id }

    context 'render_views' do
      render_views
      it { expect(response).to render_template(:edit) }
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
    let!(:student) { FactoryGirl.create(:student) }
    subject(:do_destroy) { delete :destroy, id: student  }

    it { is_expected.to redirect_to action: :index }
  end
end

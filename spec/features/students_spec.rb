require 'rails_helper'

feature "Student", type: :feature do

  def fill_student_form
    fill_in "student_name",             with: "João Silva"
    fill_in "student_register_number",      with: "3"
  end
  
  describe '#create' do
    context 'when visiting :new' do
      before { visit new_student_path }

      it 'creates a student', js: true do
        within 'form#new_student' do
          fill_student_form
          click_button("Cadastrar")
        end

        expect(page).to have_content("Estudante criado com sucesso.")
        expect(page).to have_content("João Silva")
        expect(page).to have_content("Active")
        expect(page).to have_content("3")
      end
    end
  end

  describe '#update' do
    student = FactoryGirl.create(:student)
    context 'when visiting :edit' do
      before { visit edit_student_path(student.id) }

      it 'edits a student', js: true do
        within 'form.edit_student' do
          fill_student_form

          find('#student_status option:nth-child(2)').select_option

          click_button("Cadastrar")
        end

        expect(page).to have_content("Estudante editado com sucesso.")
        expect(page).to have_content("João Silva")
        expect(page).to have_content("Inactive")
        expect(page).to have_content("3")
      end
    end
  end

  describe '#show' do
    student = FactoryGirl.create(:student)
    context 'when visiting :show' do
      before { visit student_path(student.id) }

      it 'shows a student', js: true do
        # FactoryGirl default values
        expect(page).to have_content("Teste")
        expect(page).to have_content("Active")
        expect(page).to have_content("1")
      end
    end
  end

  describe '#index' do
    context 'when visiting :index' do
      before { visit students_path }

      it 'displays all the students', js: true do
        expect(page).to have_content("Lista de Estudantes")
        expect(page).to have_content("João Silva")
        expect(page).to have_content("Novo Estudante")
      end
    end
  end

  describe '#destroy' do
    context 'when visiting :index' do
      before { visit students_path }

      it 'deletes a student', js: true do
        expect{
          page.evaluate_script('window.confirm = function() { return true; }') #Simulating alert 'Ok' click 
          click_link('Remover', match: :first)        
        }.to change(Student,:count).by(-1)        
      end
    end
  end

end
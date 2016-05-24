require 'rails_helper'

feature "Course", type: :feature do

  def fill_course_form
    fill_in "course_name",             with: "Computação"
    fill_in "course_description",      with: "Descricao do curso"
  end
  
  describe '#create' do
    context 'when visiting :new' do
      before { visit new_course_path }

      it 'creates a course', js: true do
        within 'form#new_course' do
          fill_course_form
          click_button("Cadastrar")
        end

        expect(page).to have_content("Curso criado com sucesso.")
        expect(page).to have_content("Computação")
        expect(page).to have_content("Active")
        expect(page).to have_content("Descricao do curso")
      end
    end
  end

  describe '#update' do
    course = FactoryGirl.create(:course)
    context 'when visiting :edit' do
      before { visit edit_course_path(course.id) }

      it 'edits a course', js: true do
        within 'form.edit_course' do
          fill_course_form

          find('#course_status option:nth-child(2)').select_option

          click_button("Cadastrar")
        end

        expect(page).to have_content("Curso editado com sucesso.")
        expect(page).to have_content("Computação")
        expect(page).to have_content("Inactive")
        expect(page).to have_content("Descricao do curso")
      end
    end
  end

  describe '#show' do
    course = FactoryGirl.create(:course)
    context 'when visiting :show' do
      before { visit course_path(course.id) }

      it 'shows a course', js: true do
        # FactoryGirl default values
        expect(page).to have_content("Curso")
        expect(page).to have_content("Descricao")
        expect(page).to have_content("Active")
      end
    end
  end

  describe '#index' do
    context 'when visiting :index' do
      before { visit courses_path }

      it 'displays all the courses', js: true do
        expect(page).to have_content("Lista de cursos")
        expect(page).to have_content("Computação")
        expect(page).to have_content("Novo Curso")
      end
    end
  end

  describe '#destroy' do
    context 'when visiting :index' do
      before { visit courses_path }

      it 'deletes a course', js: true do
        expect{
          page.evaluate_script('window.confirm = function() { return true; }') #Simulating alert 'Ok' click 
          click_link('Remover', match: :first)        
        }.to change(Course,:count).by(-1)        
      end
    end
  end

end
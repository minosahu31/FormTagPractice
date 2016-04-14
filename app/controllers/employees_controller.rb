class EmployeesController < ApplicationController

  before_action :find_employee, only: [:show, :edit, :update, :destroy] 
  before_action :find_employees, only: [:index, :create, :destroy, :update]
  respond_to :html, :js


  def index
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
  end

  def edit
  end

  def update
    @employee.update(employee_params)
  end

  def destroy
    @employee.destroy
  end
  
  private

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.permit(:name, :designation)
  end

  def find_employees
     @employees = Employee.all
  end

end


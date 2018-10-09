class EmployeesController < ApplicationController
  def create
    @companies = Company.find(params[:company_id])
    @employee = @companies.employees.build(employee_param)
    if @employee.save

      redirect_to companies_path(@employee.company_id)
    end
  end
  def employee_param
  params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
  end
def destroy
  @employee = Employee.find(params[:id])
  @employee.destroy
  redirect_to @employee.company

end
end

class CompaniesController < ApplicationController

  # TODO:
   def index
    #get data in
    #handle business logic
    #render htlml file views
    @companies = Company.all 
   end

  
  def show
     @company = Company.find_by({ "id" => params["id"] })
     # on url /1 then params id =1, then company id =1
     @contacts = Contact.where({ "company_id" => @company["id"] })

  end

  def new
    @company=Company.new
  end 

  # def create
  #   @company=Company.new(params["company"])
  #   @company.save
  #   redirect_to "/companies"
  # end 

# params["company"] contains all the data we need to create a new company.


def create
  @company = Company.new
  @company["name"] = params["company"]["name"]
  @company["city"] = params["company"]["city"]
  @company["state"] = params["company"]["state"]
  @company.save
  redirect_to "/companies"
end


def edit
  @company = Company.find_by({ "id" => params["id"] })
end

def update
  @company = Company.find_by({ "id" => params["id"] })
  @company["name"] = params["company"]["name"]
  @company["city"] = params["company"]["city"]
  @company["state"] = params["company"]["state"]
  @company.save
  redirect_to "/companies"
end

def destroy
  @company = Company.find_by({ "id" => params["id"] })
  @company.destroy
  redirect_to "/companies"
end
















end


class Person
  require 'date'
  attr_accessor :dob,
                :first_name,
                :surname,
                :fullname

  attr_reader   :email,
                :phone_numbers


  def initialize(first_name, surname ,dob)
    @dob = Date.parse(dob)
    @first_name = first_name.capitalize
    @surname = surname.capitalize
    @email = []
    @phone_numbers = []
  end

  def add_email(email)
    @email << email
  end

  def add_phone(phone)
    @phone_numbers << phone
  end

  def remove_email(email)
    @email.delete(email)

  end

  def describe
    "#{@first_name} #{@surname} was born on #{@dob}.\n Their email addresses are: #{@email}.\n Their phone numbers are #{@phone_numbers}"
  end


  def print_details

    emailsStr = ""
    @email.each do |e|
      emailsStr += "- #{email} \n"
    end
    phoneStr = ""
    @phone_numbers.each do |phones|
     phoneStr += "- #{phones} \n"
    end


    puts ""
    puts "#{@first_name} #{@surname}"
    puts "\n"
    puts  "--------------"
    puts "\n"
    puts  "Date of Birth: #{@dob.strftime('%-d %B %Y')}"
    puts "\n"
    puts  "Email Addresses:\n#{emailsStr}"
    puts  "Phone Numbers:\n#{phoneStr}"
  end
end

class FamilyMember < Person
  attr_accessor :relationships
  def initialize(first_name, surname, dob = nil, realtionship = nil)
    @relationships = relationships
    super(first_name, surname, dob)
  end
end

class AddressBook < Person

  require 'yaml'
  attr_accessor :contact

  def initialize
    @contact = []
  end

  def add_person(person)
    if person.is_a? Person
      @contact << person
      else
      raise "You must provide a valid Person object"
    end
  end

  def list
    puts "Address Book \n-----------------\n"
    @contact.each_with_index do |people, i|
      puts "Entry #{i+1}: #{person.fullname}"
    end
  end


 def load_yaml(file)
   data = YAML.load_file(file)
   array = data["people"]
   array.each do |person|
   end

   person = Person.new person["fname"], person["surname"], person["dob"]

   person["emails"].each do |email|
     person.add_email email
   end

   person["phones"].each do |phone|
     person.add_phone phone
    end

  @contact << person

  return self
end
#addressBook = AddressBook.new
#addressBook.load_yaml 'mydata.yml'
#addressbook.list
end

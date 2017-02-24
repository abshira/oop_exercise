
class Person
  require 'yaml'
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
    #@fullname = @first_name + ' ' + @surname
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
    #@email.delete_at(email)
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
  attr_accessor :contact
  def initialize
    @contact = []
    load_contact_details
  end

  def add people
    if people.is_a? Person
      @contact << person
      raise TypeError, 'This is not a person/family member'
    else
      @people << people
    end
  end

  def list
    puts "Address Book \n-----------------\n"
    @contact.each_with_index do |people, i|
      puts "Entry #{i+1}: #{person.fullname}"
    end
  end

  def load_contact_details
    unless File.exists?("mydata.yml")
      File.new("mydata.yml", "w+")
    end

    @contact = YAML.load_file("mydata.yml")
  end

  File.open("mydata.yml", "r+") do |f|
    f.write(@contact.to_yaml)
  end
end
addressBook = AddressBook.new
addressbook.list

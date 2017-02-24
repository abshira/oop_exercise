describe Person do
  let(:person){ Person.new("joe", "bloggs", "1 Jan 1990") }

  it "should inititalize properly" do
    #person = Person.new "joe", "bloggs", "1 Jan 1990"
    expect(person.class).to eq Person
    expect(person.dob.strftime('%-d %b %Y')).to eq ("1 Jan 1990")
    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    #ßexpect(person.fullname).to eq "Joe Bloggs"
    expect(person.email).to eq []
    expect(person.phone_numbers).to eq []
  end


    it "should inititalize properly" do
      expect(person.class).to eq Person
      expect(person.dob.strftime('%-d %b %Y')).to eq ("1 Jan 1990")
      expect(person.first_name).to eq "Joe"
      expect(person.surname).to eq "Bloggs"
      #ßexpect(person.fullname).to eq "Joe Bloggs"
      expect(person.email).to eq []
      expect(person.phone_numbers).to eq []
    end
  #it "should produce a full name , ensuring it uses .capitalize"
  #  person = Person.new
  #  person.full_name= "Joe Bloggs"
  #  expect(person.full_name).to eq "Joe Bloggs"
  #Íend

  it "should be able to accept an array of emails" do
    #person = Person.new "joe", "bloggs", "1 Jan 1990"
    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"
    expect(person.email).to eq ["joe@foo.com", "joe.bloggs@work.com"]
  end

  it "should be able to accept an array of numbers" do
    #person = Person.new "joe", "bloggs", "1 Jan 1990"
    person.add_phone "07712345678"
    person.add_phone "02012345678"
    expect(person.phone_numbers).to eq ["07712345678", "02012345678"]
  end

  it "should be able to remove a email from the array" do
    #person = Person.new "joe", "bloggs", "1 Jan 1990"
    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"
    person.remove_email "joe.bloggs@work.com"
    #person.remove_email (0)
    expect(person.email).to eq ["joe@foo.com"]
  end

  it "describe a person" do
		#person = Person.new "joe", "bloggs", "1 Jan 1990"
		#person.full_name= "Joe Bloggs"
		#person.dob= "1990-01-01"
		person.add_email "joe@foo.com"
    person.add_phone "07712345678"
    person.add_phone "02012345678"
		expect(person.describe).to eq("Joe Bloggs was born on 1990-01-01.\n Their email addresses are: [\"joe@foo.com\"].\n Their phone numbers are [\"07712345678\", \"02012345678\"]")
	end
end

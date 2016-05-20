# Global variables to store input from command line
instance, @@in_value, instance_type, @@in_type, allow_ssh_from, @@ip = ARGV

# Create class called output
# containing methods to create & display output 2 or
# display output 1 using input from user.
class Output
  # Array declared to hold contents of the source file.
  # each line on the file is assigned to an element of the array.
  # Reads contents of source file "output.rb" into array called my_array.
  my_array = IO.readlines('/Users/harrykorang/assignment/doc/output')
  # new array created to contain portion of lines
  # in my_array to be edited by the instance_type method.
  @@my_array_a = my_array[0..51]
  # new array created to contain portion of lines
  # in my_array to be edited by the instance method.
  @@my_array_b = my_array[28..47]
  # new array created to contain portion of lines
  # in my_array to be edited by the allow_ssh_from method.
  @@my_array_c = my_array[48..83]
  # new array created to display contents of output 1
  # wheb output 1 method used.
  @@output_1 = my_array

  # Method to use input from user to replace instance type.
  def instance_type
    @@my_array_a[34] = '        "InstanceType": "'"#{@@in_type}"'",'
  end

  # Method to (1): to use input from user to add value to "EC2Instance" line.
  # and store in element 0 in my_array_b.
  # (2): to use input from user replace instance type.
  # and store in element 6 in my_array_b.
  def instance
    @@my_array_b[0] = '    "EC2Instance'"#{@@in_value}"'": {'
    @@my_array_b[6] = '        "InstanceType": "'"#{@@in_type}"'",'
  end

  # Method to use input from user to edit the required IP address
  # for output 2.
  def allow_ssh_from
    @@my_array_c[14] = '            "CidrIp": "'"#{@@ip}"'/32",'
  end

  # Method to combine content of above arrays, ending in 'a - c',
  # and to display them as output 2.
  def output_2
    puts @@my_array_a
    puts @@my_array_b
    puts @@my_array_c
  end

  # Method to display output 1.
  def output_1
    puts @@output_1
  end
end

# if..else condition used to control which output is displayed depending on
# input from command line.
# Display contents of output 1 if incorrect or no parameters are entered at
# the command line after 'ruby assignment.rb'.
if instance != '--instances' || instance_type != '--instance-type' ||
   allow_ssh_from != '--allow-ssh-from' || @@in_value != '2' ||
   @@in_type != 't2.small' || @@ip != '37.17.210.74'
  puts 'Incorrect or no additional parameters entered --Displaying Output 1--'
  # Display Output 1
  output_1 = Output.new # create new output object.
  output_1.output_1 # call the output_1 method to display output 1.

else # A new instance of Output class created.
  # All methods applied to the new instance.
  # The new instance displays content as "Output 2".
  puts 'Correct parameters entered -- Displaying Output 2 --'
  section = Output.new
  section.instance_type
  section.instance
  section.allow_ssh_from
  section.output_2
end

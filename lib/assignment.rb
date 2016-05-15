


#Global variables to store input from command line
$instance, $in_value, $instance_type, $in_type, $allow_ssh_from, $ip = ARGV

#Array declared to hold contents of the source file. each line on the file is assigned to an element of the array.
$my_array = []

# Reads contents of source file "output.rb" into array called my_array.
$my_array = IO.readlines('/Users/harrykorang/Desktop/Assignment/assignment/doc/output')

#Create class called output containing methods to create output2 using input from user.
class Output
	# Method to use input from user replace instance type.
	def instance_type 
		$my_array_a = $my_array[0..51] # new array created to contain portion of lines to be edited.
		$my_array_a[34] = '       "InstanceType": "'"#{$in_type}"'",'
		#$my_array_a[34] = '       "InstanceType": "'"t2.small"'",'
		#puts $my_array_a
	end
	 
	#Method to (1): to use input from user to add value to "EC2Instance" line. (2): to use input from user replace instance type. 
	def instance
		$my_array_b = $my_array[28..47] # new array created to contain portion of lines to be edited.
		$my_array_b[0] = "    "'"EC2Instance'"#{$in_value}"'": {'
		$my_array_b[6] = '       "InstanceType": "'"#{$in_type}"'",'
	end

	# Method to use input from user to edit the required IP address for output 2.
	def allow_ssh_from
		$my_array_c = $my_array[48..83] # new array created to contain portion of lines to be edited.
		$my_array_c[14] = '            "CidrIp": "'"#{$ip}"'/32",'
	end

	# Method to combine content of above arrays, ending in 'a - c', and to display them as output 2. 
	def output_2
		puts $my_array_a
		puts $my_array_b
		puts $my_array_c 
		
	end
end

# if..else condition used to control which output is displayed depending on input from command line.
# Display contents of output 1 if incorrect or no parameters are entered at the command line after 'ruby assignment.rb'.
if $instance != "--instances" || $instance_type != "--instance-type" || $allow_ssh_from != "--allow-ssh-from" ||
	$in_value != "2" || $in_type != "t2.small" || $ip != "37.17.210.74"
	puts "Incorrect or no additional parameters entered -- Displaying Output 1 -- "
	puts $my_array # Display Output 1

else # A new instance of Output class created. 
	 # All methods applied to the new instance. 
	 # The new instance displays content as "Output 2".
puts "Correct parameters entered -- Displaying Output 2 --"
section = Output.new
section.instance_type
section.instance
section.allow_ssh_from
section.output_2
end


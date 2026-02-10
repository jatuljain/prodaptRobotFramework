# To check if the given IP address is valid or not
import ipaddress

def checkipv4(ip):
	# Use the ip_address function from the ipaddress module to check if the input is a valid IPv4 address
	try:
		ip= ip.split('/')
		print(ip[0])
		return ipaddress.IPv4Address(ip[0])
		# print("Valid IPv4 address")
	except ValueError:
		# If the input is not a valid IP address, catch the exception and print an error message
		return "Invalid IPv4 address"

def checkipv6(ip):
	# Use the ip_address function from the ipaddress module to check if the input is a valid IPv6 address
	try:
		ip= ip.split('/')
		print(ip[0])
		return ipaddress.IPv6Address(ip[0])
		# print("Valid IPv6 address")
	except ValueError:
		# If the input is not a valid IP address, catch the exception and print an error message
		return "Invalid IPv6 address"
		print("This will never be called")




# Driver Code
if __name__ == '__main__':
	ip = "192.168.0.1/22"
	value = checkipv4(ip)
	print("IPv4:", value)

	ip = "3.1.2.2"
	value = checkipv4(ip)
	print("IP: ", value)

	ip = "2002:db8::/55"
	value =  checkipv6(ip)
	print("IPv6:", value)


	ip = "z002:db8::/44"
	value =  checkipv6(ip)
	print("IPv6: ", value)




#This code is contributed by Edula Vinay Kumar Reddy

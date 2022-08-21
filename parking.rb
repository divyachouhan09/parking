class Parking
	attr_accessor :slot_no, :color, :plate_no

	def initialize(i,a)
		@slot_no=i
		@plate_no=a[1]
		@color=a[-1]
	end

	def show_status
		if total_slots==0
			puts"No slots are created"
		else
			puts "#{@slot_no} | #{@plate_no} | #{@color}"
		end
	end

	def plate_no_for_color(car_color)
		if(car_color==@color)
			print"#{@plate_no} "
			return 0
		end
	end

	def slot_no_for_color(car_color)
		if(car_color==@color)
			print"#{@slot_no} "
			return 0
		end
	end

	def slot_no_for_plate_no(car_color)
		if(car_color==@plate_no)
			print"#{@slot_no} "
			return 0
		end
	end
end	

def make_obj (a,hsh,y,total_slots)
    for i in 1..total_slots

	    if !hsh.key?(i)
	    	hsh[i]=Parking.new(i,a)
		    puts "Alloted slot number: #{i}"
	    	return
	    end

	end
	puts "Sorry, parking lot is full"
end
		
n=gets.chomp.to_i
hsh={}
x=gets.chomp.split(" ")
total_slots=x[-1].to_i
puts "created parking of #{total_slots} slots"
n.times do |k|

	a=gets.chomp.split(" ")

	case a[0]

		when "park"
			make_obj(a,hsh,0,total_slots)
			
				
		when "leave"
		    hsh.delete(a[-1].to_i)
			puts "Slot no #{a[-1]} is free"

		when "status"
			puts "Slot No. | Plate Number | Colour"
			    hsh.each do |key,value|
			    	hsh[key].show_status
			    end

		when "plate_numbers_for_cars_with_colour"
			hsh.each do |key,value|
				if hsh[key].plate_no_for_color(a[-1])!=0
					puts"#{a[-1]} does not exist"
				end
			end

		when "slot_numbers_for_cars_with_colour"
			hsh.each do |key,value|
				if hsh[key].slot_no_for_color(a[-1])!=0
					puts"#{a[-1]} does not exist"
				end
			end

		when "slot_number_for_registration_number"
			hsh.each do |key,value|
				if hsh[key].slot_no_for_plate_no(a[-1])!=0
					puts"#{a[-1]} does not exist"
				end
			end

		when "add"
			total_slots+=a[1].to_i
			puts"#{a[1]} slots added"

		when "remove"
			if (total_slots-hsh.size)>=a[1].to_i
				total_slots-=a[1].to_i
				puts"#{a[1]} slots removed"
			else
				puts"Sorry, slots are occupied can't remove slots"
			end
		else
			puts"invalid command"
	end
end

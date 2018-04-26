! parameters
write/key scaling/r/1/1 3.0

! iterator var
write/key n/i/1/1 1

! crating the display 
!!! (MIDAS) might fail here
!!! if so, please comment folowing sting 
!!! and create display manually in inmidas
create/disp

! creating table
cre/tab k-data
cre/col k-data times

! loop for 25 files named like "k12.fit"
do n = 1 25

	write/key name/C/1/10 {n}

	! getting fliename
	comp/key name = m$repla(name, "000", "k")
	comp/key name = m$repla(name, "00", "k") 
	comp/key name = name // ".fit"
	read/key name

	loa/ima {name} ? {scaling},{scaling}
	mag/cir ? table1 p3=@10,@2,@2 a p5=1 p6=2
	mag/cir ? table2 p3=@10,@2,@2 a p5=1 p6=2
	mag/cir ? table3 p3=@10,@2,@2 a p5=1 p6=2

	copy/tt table1 :magnitude k-data :magn_var
	copy/tt table2 :magnitude k-data :magn_st1
	copy/tt table3 :magnitude k-data :magn_st2

	comp/table k-data :ans1 = :magn_var - :magn_st1 + 7.42
	comp/table k-data :ans2 = :magn_var - :magn_st2 + 6.93

	write/tab k-data :times {n} {{name},o_time(1)}
	read/tab k-data
	
	cle/cha 2

enddo

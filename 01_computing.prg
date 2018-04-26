! == vars == 

! = iterators =
write/key n/i/1/1 1
write/key m/i/1/1 1
write/key k/i/1/1 1

! = temporary =
write/key t/r/1/1 0.0
! == == == == == == == 


! === create a summary table ===
! (description in comments below)

! == table ==
cre/tab summary ! filename summary.tbl
! = columns =
cre/col summary times     ! time 

cre/col summary magn_var  ! magnitude of the variable

cre/col summary j1  ! -- VARIABLE STAR MAGNITUDE -- 
cre/col summary j2  ! - in j band 

cre/col summary k1  ! - in k band
cre/col summary k2  ! ---------------

cre/col summary j_k1 ! -- THE VARIABLE STAR 
cre/col summary j_k2 ! -- COLOR INDEX
! == == == == == == == 

! == computing ==
do n = 1 21
	do m = 1 25

		if {j-data,:times,{n}} .eq. {k-data,:times,{m}} then
			
			write/tab summary :times {k} {j-data,:times,{n}}

			comp/key t = {j-data,:magn_var,{n}} - {k-data,:magn_var,{m}}
			write/tab summary :magn_var {k} {t} 


			comp/key t = {j-data,:ans1,{n}}
			write/tab summary :j1 {k} {t} 

			comp/key t = {k-data,:ans1,{m}}
			write/tab summary :k1 {k} {t} 


			comp/key t = {j-data,:ans2,{n}}
			write/tab summary :j2 {k} {t} 

			comp/key t = {k-data,:ans2,{m}}
			write/tab summary :k2 {k} {t} 


			comp/key t = {j-data,:ans1,{n}} - {k-data,:ans1,{m}}
			write/tab summary :j_k1 {k} {t} 

			comp/key t = {j-data,:ans2,{n}} - {k-data,:ans2,{m}}
			write/tab summary :j_k2 {k} {t} 


			comp/key k = k + 1

		endif
	end do
end do
! === === === === === === === === === === === === === === === === 


! === compute averaged values and    ===
! === add them to the summary table  ===

comp/tab summary :j = (:j1 + :j2)/2  ! for each spectrum band
comp/tab summary :k = (:k1 + :k2)/2  

comp/tab summary :j_k = (:j_k1 + :j_k2)/2 ! for color index

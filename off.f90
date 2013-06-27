! Copyright 2013 Francisco Souza. All rights reserved.
! Use of this source code is governed by a BSD-style
! license that can be found in the LICENSE file.

program off
   use omp_lib
   implicit none
   integer, parameter :: n = 500000
   integer :: i
   integer, dimension(n) :: values
   !dir$ omp offload target(mic)
   !$omp parallel do
   do i=1,n
      values(i) = i ** 2
   end do
end program

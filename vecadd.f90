! Copyright 2013 Francisco Souza. All rights reserved.
! Use of this source code is governed by a BSD-style
! license that can be found in the LICENSE file.

program vecaddition
   use omp_lib
   use vectors, only: vecadd
   implicit none
   integer, parameter :: n = 10
   integer :: i
   integer, dimension(n) :: a, b, c
   !$omp parallel do
   do i=1,n
      a(i) = i ** 2
      b(i) = i * 2
   end do
   call vecadd(a, b, c, n)
   print *, c
end program

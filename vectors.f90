! Copyright 2013 Francisco Souza. All rights reserved.
! Use of this source code is governed by a BSD-style
! license that can be found in the LICENSE file.

module vectors
   implicit none
contains
   subroutine vecadd(a, b, c, n)
      integer, intent(in) :: n
      integer, intent(in) :: a(n), b(n)
      integer, intent(out) :: c(n)
      integer :: i
      !dir$ omp offload target(mic)
      !$omp parallel do
      do i=1,n
         c(i) = a(i) + b(i)
      end do
   end subroutine
end module

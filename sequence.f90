! Copyright 2013 Francisco Souza. All rights reserved.
! Use of this source code is governed by a BSD-style
! license that can be found in the LICENSE file.

program sequence
   use mpi
   implicit none
   integer :: ierr, numprocs, proc_num, i, j
   integer, dimension(MPI_STATUS_SIZE) :: status

   call mpi_init(ierr)
   call mpi_comm_size(MPI_COMM_WORLD, numprocs, ierr)
   call mpi_comm_rank(MPI_COMM_WORLD, proc_num, ierr)

   if (numprocs < 2) then
      print *, "Needs at least 2 processes"
      go to 99
   end if

   if (proc_num == 0) then
      i = 0
      do while(i < 500)
         do j = 1, numprocs - 1
            call mpi_send(i, 1, MPI_INTEGER, j, 0, MPI_COMM_WORLD, ierr)
            i = i + 1
         end do
      end do
   else
      call mpi_recv(i, 1, MPI_INTEGER, MPI_ANY_SOURCE, MPI_ANY_TAG, &
                    MPI_COMM_WORLD, status, ierr)
      print *, i
   end if
99 continue
   call mpi_finalize(ierr)
end program

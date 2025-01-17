program arrays

    implicit none

    

    type :: cell
        double precision  :: density
        double precision , dimension(2) :: velocity
    end type cell

    type(cell), dimension(5,5) :: cells
    double precision :: dt
    integer :: nsteps
    integer :: i, j, n


   ! Initialize random seed
    call random_seed()

    ! Initialize the cells array
    do i=1, 5
        do j=1, 5
            call random_number(cells(i,j)%velocity)
            ! cells(i,j)%velocity = [0.0, 0.0]
            cells(i,j)%density = 1.0
        end do
    end do
    dt = 1.0/60.0
    print *,dt
    nsteps = 1!00


    do n=1, nsteps
        ! Update the cells
        do i=1, 5
            do j=1, 5
                ! calculate the new density & velocity
                cells(i,j)%velocity(1) = cells(i,j)%velocity(1) + dt
                print '("tour",I3, I2, I2, ": (", F6.3, ",", F6.3, ")")', n, i, j, cells(i, j)%velocity(1), cells(i, j)%velocity(2)
            end do
        end do
    end do



end program arrays

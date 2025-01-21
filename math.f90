program arrays

    implicit none

    integer, parameter :: dim = 5
    real, dimension(dim+1,dim+1) :: u
    real, dimension(dim+1,dim+1) :: v
    real, dimension(dim,dim) :: divergence
    ! real, dimension(dim,dim) :: pressure
    real, dimension(0:dim+1,0:dim+1) :: is_fluid
    double precision :: dt
    integer :: nsteps
    integer :: i, j, n
    integer, parameter :: g = 1
    real :: inv_nb_border_fluid_cells

   ! Initialize random seed
    call random_seed()

    ! Initialize the cells array
    do i=1, dim+1
        do j=1, dim+1
            if (i == 0 .OR. i==dim+1) then
                u(i,j) = 0
            else 
                v(i,j) = 1
            end if
            if (j==0 .OR. j==dim+1) then
                v(i,j) = 0
            else 
                v(i,j) = 1
            end if
        end do
    end do

    do i=1, dim
        do j=1, dim
            divergence(i,j) = u(i,j) - u(i+1,j) + v(i,j) - v(i,j+1)
        end do
    end do

    do i=0, dim+1
        do j=0, dim+1
            if (i==0 .OR. i==dim+1 .OR. j==0 .OR. j==dim+1) then
                is_fluid(i,j) = 0
            else
                is_fluid(i,j) = 1 ! 0 if it's a border cell, 1 otherwise
            end if
        end do
    end do



    dt = 1.0/60.0
    print *,dt
    nsteps = 100


    do n=1, nsteps
        ! Update the cells 
        do i=1, dim
            do j=1, dim
                inv_nb_border_fluid_cells = 1/(is_fluid(i+1,j)+is_fluid(i-1,j)+is_fluid(i,j+1)+is_fluid(i,j-1))
                ! calculate the new velocity so that there is no divergence
                u(i,j) = u(i,j) + divergence(i,j)*is_fluid(i-1,j)*inv_nb_border_fluid_cells
                v(i,j) = v(i,j) + divergence(i,j)*is_fluid(i+1,j)*inv_nb_border_fluid_cells
                u(i+1,j) = u(i+1,j) - divergence(i,j)*is_fluid(i,j-1)*inv_nb_border_fluid_cells
                v(i,j+1) = v(i,j+1) - divergence(i,j)*is_fluid(i,j+1)*inv_nb_border_fluid_cells
            end do
        end do
    end do



end program arrays










program arrays

    implicit none

    type :: cell
        double precision  :: density
        double precision , dimension(2) :: velocity
    end type cell

    integer, dimension(2) :: dimensions
    dimensions = [5, 5]

    double precision :: step
    step = 1.0 / segmentation

    type(cell), dimension(dimensions(0), dimensions(1)) :: cells
    do i=1, dimensions(0)
        do j=1, dimensions(1)
            cells(i, j)%density = 0.0
            cells(i, j)%velocity = [0.0, 0.0]
        end do
    end do

        
end program arrays

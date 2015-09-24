
! A simple generic linked list test program
program list_test
  use linked_list
  use ll_data
  implicit none

  type(list_t), pointer :: ll => null()
  type(data_t), target :: dat_a
  type(data_t), target :: dat_b
  type(data_ptr) :: ptr

  ! Initialize two data objects
  dat_a%x = 17.5
  dat_b%x = 3.0

  ! Initialize the list with dat_a
  ptr%p => dat_a
  call list_init(ll, DATA=transfer(ptr, list_data))
  print *, 'Initializing list with data:', ptr%p

  ! Insert dat_b into the list
  ptr%p => dat_b
  call list_insert(ll, DATA=transfer(ptr, list_data))
  print *, 'Inserting node with data:', ptr%p

  ! Get the head node
  ptr = transfer(list_get(ll), ptr)
  print *, 'Head node data:', ptr%p

  ! Get the next node
  ptr = transfer(list_get(list_next(ll)), ptr)
  print *, 'Second node data:', ptr%p

  ! Free the list
  call list_free(ll)
end program list_test

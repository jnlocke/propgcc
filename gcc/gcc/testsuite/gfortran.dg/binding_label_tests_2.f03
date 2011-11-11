! { dg-do compile }
module binding_label_tests_2

contains
  ! this is just here so at least one of the subroutines will be accepted so
  ! gfortran doesn't give an Extension warning when using -pedantic-errors
  subroutine ok() 
  end subroutine ok

  subroutine sub0() bind(c, name="   1") ! { dg-error "Invalid C name" }
  end subroutine sub0 ! { dg-error "Expecting END MODULE" }

  subroutine sub1() bind(c, name="$") ! { dg-error "Invalid C name" }
  end subroutine sub1 ! { dg-error "Expecting END MODULE" }

  subroutine sub2() bind(c, name="abc$") ! { dg-error "Invalid C name" }
  end subroutine sub2 ! { dg-error "Expecting END MODULE" }

  subroutine sub3() bind(c, name="abc d") ! { dg-error "Embedded space" }
  end subroutine sub3 ! { dg-error "Expecting END MODULE" }

  subroutine sub5() BIND(C, name=" myvar 2 ") ! { dg-error "Embedded space" }
  end subroutine sub5 ! { dg-error "Expecting END MODULE" }

  subroutine sub6() bind(c, name="         ) ! { dg-error "Invalid C name" }
  end subroutine sub6 ! { dg-error "Expecting END MODULE" }

  subroutine sub7() bind(c, name=) ! { dg-error "Syntax error" }
  end subroutine sub7 ! { dg-error "Expecting END MODULE" }

  subroutine sub8() bind(c, name) ! { dg-error "Syntax error" }
  end subroutine sub8 ! { dg-error "Expecting END MODULE" }
end module binding_label_tests_2 

! { dg-final { cleanup-modules "binding_label_tests_2" } }

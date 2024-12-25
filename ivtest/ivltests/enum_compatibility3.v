// Check that enum types implicitly imported from a package are compatible
// between different instances of a module.

package P;
  typedef enum integer {
    A
  } T;
endpackage

module M;
  import P::*;
  T e;
endmodule

module test;
  import P::*;

  M m1();
  M m2();

  initial begin
    m1.e = A;
    m2.e = m1.e;
    if (m2.e === A) begin
      $display("PASSED");
    end else begin
      $display("FAILED");
    end
  end
endmodule

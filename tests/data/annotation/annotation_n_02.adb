with DXPL_Types_32; use DXPL_Types_32;

------------------------------------------------------------------------
--!  Copyright 2009 Chair of Media Security / Prof. Dr. Stefan Lucks
--!
--!  Author        :: dennis.hoppe@uni-weimar.de
--!  Created       :: 09/18/2009
--!  Last-Modified :: 09/18/2009
--!
--!  TEST
--!    * ANNOTATIONS (NEGATIVE)
--!
--!  Testing annotations. Compiler has to fail. Pairs of --# BEGIN
--!  and --# END have to be consistent within the procedure, they
--!  are declared.
------------------------------------------------------------------------
procedure Annotation_N_02 is

    procedure Q (M : in out DXPL_Types_32.Word_Array_2) is
    begin
        Message (0) := Message (0) + Message (1);
        --# END
    end Q;

    --------------------
    --  DXPL_Process  --
    --------------------

    procedure DXPL_Process (Message : out DXPL_Types_32.Word_Array_2) is
    begin
        --# BEGIN
        Q (Message);
    end DXPL_Process;

-------------
--  SETUP  --
-------------
    
begin
    DXPL_Types_32.Configuration
        (DXPL_ALGORITHM   => "Simple Hash",
         DXPL_ROUNDS      => 10,
         DXPL_TERMINATION => 256);

    DXPL_Types_32.Test_Vector
        (DXPL_MESSAGE => (0 => 16#01234567#, 1 => 16#89abcdef#),
         DXPL_DIGEST  => (0 => 16#126c6b92#, 1 => 16#c0653a3e#));

end Annotation_N_02;

with DXPL_Types_32; use DXPL_Types_32;

------------------------------------------------------------------------
--!  Copyright 2009 Chair of Media Security / Prof. Dr. Stefan Lucks
--!
--!  Author        :: dennis.hoppe@uni-weimar.de
--!  Created       :: 09/18/2009
--!  Last-Modified :: 09/18/2009
--!
--!  TEST
--!    * EXPRESSION (NEGATIVE)
--!
--!  'if' block. Compiler should mumble at the moment.
------------------------------------------------------------------------
procedure Expression_N_00 is

    --------------------
    --  DXPL_Process  --
    --------------------

    procedure DXPL_Process (Message : out DXPL_Types_32.Word_Array_2) is
        I : Integer := 20;
    begin
        if I > 10 then
            Message (0) := Message (0) + Message (1);
        end if; 
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

end Expression_N_00;

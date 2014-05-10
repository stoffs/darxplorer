--  Copyright 2005 Simon Wright <simon@pushface.org>

--  This package is free software; you can redistribute it and/or
--  modify it under terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 2, or
--  (at your option) any later version. This package is distributed in
--  the hope that it will be useful, but WITHOUT ANY WARRANTY; without
--  even the implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE. See the GNU General Public License for more
--  details. You should have received a copy of the GNU General Public
--  License distributed with this package; see file COPYING.  If not,
--  write to the Free Software Foundation, 59 Temple Place - Suite
--  330, Boston, MA 02111-1307, USA.

--  As a special exception, if other files instantiate generics from
--  this unit, or you link this unit with other files to produce an
--  executable, this unit does not by itself cause the resulting
--  executable to be covered by the GNU General Public License.  This
--  exception does not however invalidate any other reasons why the
--  executable file might be covered by the GNU Public License.

--  $Revision: 1391 $
--  $Date: 2009-01-12 20:55:33 +0000 (Mon, 12 Jan 2009) $
--  $Author: simonjwright $

--  This implementation is for GNAT on Intel i86 hardware (Linux,
--  Windows).

with System.Machine_Code;

separate (BC.Support.High_Resolution_Time)
function Clock return Time is
   type Half is (Low, High);
   Lower, Upper : Interfaces.Unsigned_32;
   Results : array (Half) of Interfaces.Unsigned_32;
   Result : Time;
   for Result'Address use Results (Low)'Address;
begin
   System.Machine_Code.Asm
     ("rdtsc" & ASCII.LF & ASCII.HT &
        "movl %%eax, %0"& ASCII.LF & ASCII.HT &
        "movl %%edx, %1",
      Outputs => (Interfaces.Unsigned_32'Asm_Output ("=g", Lower),
                  Interfaces.Unsigned_32'Asm_Output ("=g", Upper)),
      Clobber => "eax, edx",
      Volatile => True);
   Results := (Low => Lower, High => Upper);
   return Result;
end Clock;

--  for emacs:
--  Local Variables:
--  mode: ada
--  End:
--  vim: textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab
--  vim: filetype=ada encoding=latin1 fileformat=unix

--  Copyright 1994 Grady Booch
--  Copyright 1998-2003 Simon Wright <simon@pushface.org>

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

--  $Id: ring_test_support.ads 1385 2008-12-30 18:00:00Z simonjwright $

with BC.Containers;
with BC.Containers.Rings;
with BC.Containers.Rings.Bounded;
with BC.Containers.Rings.Dynamic;
with BC.Containers.Rings.Unbounded;
with BC.Containers.Rings.Unmanaged;
with BC.Support.Standard_Storage;
with Global_Heap;

package Ring_Test_Support is

   package Containers is new BC.Containers (Item => Character);

   package Rings is new Containers.Rings;

   package RB is new Rings.Bounded
     (Maximum_Size => 100);

   package RD is new Rings.Dynamic
     (Storage => Global_Heap.Storage);

   package RU is new Rings.Unbounded
     (Storage => BC.Support.Standard_Storage.Pool);

   package RUM is new Rings.Unmanaged;

end Ring_Test_Support;

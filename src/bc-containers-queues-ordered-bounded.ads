--  Copyright 1994 Grady Booch
--  Copyright 1998-2002 Simon Wright <simon@pushface.org>

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

with BC.Support.Bounded;

	generic
	Maximum_Size : Positive;
	package BC.Containers.Queues.Ordered.Bounded is

	pragma Elaborate_Body;

	type Queue is new Abstract_Ordered_Queue with private;

	function Null_Container return Queue;

	procedure Clear (Q : in out Queue);
	--  Empty the queue of all items.

	procedure Append (Q : in out Queue; Elem : Item);
	--  Add the item to the queue; the item itself is copied.

	procedure Insert (Q : in out Queue; Elem : Item);
	--  Inserts this elements as last item in the queue.

	procedure Pop (Q : in out Queue);
	--  Remove the item from the front of the queue.

	procedure Remove (Q : in out Queue; From : Positive);
	--  Remove the item at the given index.

	function Available (Q : in Queue) return Natural;
	--  Indicates number of empty "Item slots" left in Queue

	function Length (Q : in Queue) return Natural;
	--  Return the number of items in the queue.

	function Is_Empty (Q : in Queue) return Boolean;
	--  Return True if and only if there are no items in the queue.

	function Front (Q : in Queue) return Item;
	--  Return a copy of the item at the front of the queue.

	function Location (Q : in Queue; Elem : Item) return Natural;
	--  Return the first index at which the item is found; return 0 if
	--  the item does not exist in the queue.

	function "=" (Left, Right : in Queue) return Boolean;
	--  Return True if and only if both queues have the same length and
	--  the same items; return False otherwise.

	function New_Iterator (For_The_Queue : Queue) return Iterator'Class;
	--  Return a reset Iterator bound to the specific Queue.

	private

	package Queue_Nodes
	is new BC.Support.Bounded (Item => Item,
	                         Item_Ptr => Item_Ptr);

	type Queue is new Abstract_Ordered_Queue with 
		record
			Rep : Queue_Nodes.Bnd_Node (Maximum_Size => Maximum_Size);
		end record;

	function Item_At (Q : Queue; Index : Positive) return Item_Ptr;

end BC.Containers.Queues.Ordered.Bounded;
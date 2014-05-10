--  Copyright 1994 Grady Booch
--  Copyright 2003 Simon Wright <simon@pushface.org>

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

with BC.Support.Unmanaged;

generic
package BC.Containers.Stacks.Unmanaged is

   pragma Elaborate_Body;

   type Stack is new Abstract_Stack with private;
   --  This Stack exhibits unlimited growth and collapsing, limited
   --  only by available memory.  Assignment is "deep".

   function Null_Container return Stack;

   function "=" (Left, Right : in Stack) return Boolean;
   --  Return True if and only if both stacks have the same depth and
   --  the same items in the same order; return False otherwise.

   procedure Clear (S : in out Stack);
   --  Empty the Stack of all items.

   procedure Push (S : in out Stack; Elem : Item);
   --  Add a copy of the item to the top of the Stack.

   procedure Pop (S : in out Stack);
   --  Remove the item from the top of the Stack.

   function Depth (S : in Stack) return Natural;
   --  Returns the number of items in the Stack.

   function Is_Empty (S : in Stack) return Boolean;
   --  Returns True if and only if no items are in the stack.

   function Top (S : in Stack) return Item;
   --  Return a copy of the item at the top of the Stack.

   function New_Iterator (For_The_Stack : Stack) return Iterator'Class;
   --  Return a reset Iterator bound to the specific Stack.

private

   function Item_At (S : Stack; Index : Positive) return Item_Ptr;

   procedure Add (S : in out Stack; Elem : Item);
   procedure Remove (S : in out Stack; From : Positive);

   package Stack_Nodes
   is new BC.Support.Unmanaged (Item => Item,
                                Item_Ptr => Item_Ptr);

   type Stack is new Abstract_Stack with record
      Rep : Stack_Nodes.Unm_Node;
   end record;

end BC.Containers.Stacks.Unmanaged;

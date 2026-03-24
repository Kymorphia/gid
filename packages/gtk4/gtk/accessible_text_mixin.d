/// Module for [AccessibleText] interface mixin
module gtk.accessible_text_mixin;

public import gtk.accessible_text_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    An interface for accessible objects containing formatted text.
    
    The [gtk.accessible_text.AccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text contents.
    
    You should use the `enum@Gtk.AccessibleProperty.LABEL` or the
    `enum@Gtk.AccessibleProperty.DESCRIPTION` properties for accessible
    objects containing simple, unformatted text.
*/
template AccessibleTextT()
{

  /**
      Updates the position of the caret.
      
      Implementations of the [gtk.accessible_text.AccessibleText] interface should call this
      function every time the caret has moved, in order to notify assistive
      technologies.
  */
  override void updateCaretPosition()
  {
    gtk_accessible_text_update_caret_position(cast(GtkAccessibleText*)this._cPtr);
  }

  /**
      Notifies assistive technologies of a change in contents.
      
      Implementations of the [gtk.accessible_text.AccessibleText] interface should call this
      function every time their contents change as the result of an operation,
      like an insertion or a removal.
      
      Note: If the change is a deletion, this function must be called *before*
      removing the contents, if it is an insertion, it must be called *after*
      inserting the new contents.
  
      Params:
        change = the type of change in the contents
        start = the starting offset of the change, in characters
        end = the end offset of the change, in characters
  */
  override void updateContents(gtk.types.AccessibleTextContentChange change, uint start, uint end)
  {
    gtk_accessible_text_update_contents(cast(GtkAccessibleText*)this._cPtr, change, start, end);
  }

  /**
      Updates the boundary of the selection.
      
      Implementations of the [gtk.accessible_text.AccessibleText] interface should call this
      function every time the selection has moved, in order to notify assistive
      technologies.
  */
  override void updateSelectionBound()
  {
    gtk_accessible_text_update_selection_bound(cast(GtkAccessibleText*)this._cPtr);
  }
}

template AccessibleTextGidBuilderT()
{
}

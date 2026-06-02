/// Module for [ListHeader] class
module gtk.list_header;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.list_header.ListHeader] is used by list widgets to represent the headers they
    display.
    
    [gtk.list_header.ListHeader] objects are managed just like [gtk.list_item.ListItem]
    objects via their factory, but provide a different set of properties suitable
    for managing the header instead of individual items.
*/
class ListHeader : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_header_get_type != &gidSymbolNotFound ? gtk_list_header_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListHeader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.list_header.ListHeader]
      Returns: New builder object
  */
  static ListHeaderGidBuilder builder() nothrow
  {
    return new ListHeaderGidBuilder;
  }

  /**
      Get `child` property.
      Returns: Widget used for display.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = Widget used for display.
  */
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `end` property.
      Returns: The first position no longer part of this section.
  */
  @property uint end() nothrow
  {
    return getEnd();
  }

  /**
      Get `item` property.
      Returns: The item at the start of the section.
  */
  @property gobject.object.ObjectWrap item() nothrow
  {
    return getItem();
  }

  /**
      Get `nItems` property.
      Returns: Number of items in this section.
  */
  @property uint nItems() nothrow
  {
    return getNItems();
  }

  /**
      Get `start` property.
      Returns: First position of items in this section.
  */
  @property uint start() nothrow
  {
    return getStart();
  }

  /**
      Gets the child previously set via [gtk.list_header.ListHeader.setChild] or
      null if none was set.
      Returns: The child
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_header_get_child(cast(GtkListHeader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the end position in the model of the section that self is
      currently the header for.
      
      If self is unbound, [gtk.types.INVALID_LIST_POSITION] is returned.
      Returns: The end position of the section
  */
  uint getEnd() nothrow
  {
    uint _retval;
    _retval = gtk_list_header_get_end(cast(GtkListHeader*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model item at the start of the section.
      This is the item that occupies the list model at position
      [gtk.list_header.ListHeader.start].
      
      If self is unbound, this function returns null.
      Returns: The item displayed
  */
  gobject.object.ObjectWrap getItem() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_list_header_get_item(cast(GtkListHeader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the the number of items in the section.
      
      If self is unbound, 0 is returned.
      Returns: The number of items in the section
  */
  uint getNItems() nothrow
  {
    uint _retval;
    _retval = gtk_list_header_get_n_items(cast(GtkListHeader*)this._cPtr);
    return _retval;
  }

  /**
      Gets the start position in the model of the section that self is
      currently the header for.
      
      If self is unbound, [gtk.types.INVALID_LIST_POSITION] is returned.
      Returns: The start position of the section
  */
  uint getStart() nothrow
  {
    uint _retval;
    _retval = gtk_list_header_get_start(cast(GtkListHeader*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child to be used for this listitem.
      
      This function is typically called by applications when
      setting up a header so that the widget can be reused when
      binding it multiple times.
  
      Params:
        child = The list item's child or null to unset
  */
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    gtk_list_header_set_child(cast(GtkListHeader*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.list_header.ListHeader]
class ListHeaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `child` property.
      Params:
        propval = Widget used for display.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gtk.list_header.ListHeader]
final class ListHeaderGidBuilder : ListHeaderGidBuilderImpl!ListHeaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListHeader build() nothrow
  {
    return new ListHeader(cast(void*)createGObject(ListHeader._getGType), No.Take);
  }
}

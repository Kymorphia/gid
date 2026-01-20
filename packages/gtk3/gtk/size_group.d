/// Module for [SizeGroup] class
module gtk.size_group;

import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    #GtkSizeGroup provides a mechanism for grouping a number of widgets
    together so they all request the same amount of space.  This is
    typically useful when you want a column of widgets to have the same
    size, but you can’t use a #GtkGrid widget.
    
    In detail, the size requested for each widget in a #GtkSizeGroup is
    the maximum of the sizes that would have been requested for each
    widget in the size group if they were not in the size group. The mode
    of the size group (see [gtk.size_group.SizeGroup.setMode]) determines whether
    this applies to the horizontal size, the vertical size, or both sizes.
    
    Note that size groups only affect the amount of space requested, not
    the size that the widgets finally receive. If you want the widgets in
    a #GtkSizeGroup to actually be the same size, you need to pack them in
    such a way that they get the size they request and not more. For
    example, if you are packing your widgets into a table, you would not
    include the [gtk.types.AttachOptions.Fill] flag.
    
    #GtkSizeGroup objects are referenced by each widget in the size group,
    so once you have added all widgets to a #GtkSizeGroup, you can drop
    the initial reference to the size group with [gobject.object.ObjectWrap.unref]. If the
    widgets in the size group are subsequently destroyed, then they will
    be removed from the size group and drop their references on the size
    group; when all widgets have been removed, the size group will be
    freed.
    
    Widgets can be part of multiple size groups; GTK+ will compute the
    horizontal size of a widget from the horizontal requisition of all
    widgets that can be reached from the widget by a chain of size groups
    of type [gtk.types.SizeGroupMode.Horizontal] or [gtk.types.SizeGroupMode.Both], and the
    vertical size from the vertical requisition of all widgets that can be
    reached from the widget by a chain of size groups of type
    [gtk.types.SizeGroupMode.Vertical] or [gtk.types.SizeGroupMode.Both].
    
    Note that only non-contextual sizes of every widget are ever consulted
    by size groups (since size groups have no knowledge of what size a widget
    will be allocated in one dimension, it cannot derive how much height
    a widget will receive for a given width). When grouping widgets that
    trade height for width in mode [gtk.types.SizeGroupMode.Vertical] or [gtk.types.SizeGroupMode.Both]:
    the height for the minimum width will be the requested height for all
    widgets in the group. The same is of course true when horizontally grouping
    width for height widgets.
    
    Widgets that trade height-for-width should set a reasonably large minimum width
    by way of #GtkLabel:width-chars for instance. Widgets with static sizes as well
    as widgets that grow (such as ellipsizing text) need no such considerations.
    
    # GtkSizeGroup as GtkBuildable
    
    Size groups can be specified in a UI definition by placing an `<object>`
    element with `class="GtkSizeGroup"` somewhere in the UI definition. The
    widgets that belong to the size group are specified by a `<widgets>` element
    that may contain multiple `<widget>` elements, one for each member of the
    size group. The ”name” attribute gives the id of the widget.
    
    An example of a UI definition fragment with GtkSizeGroup:
    
    ```xml
    <object class="GtkSizeGroup">
      <property name="mode">GTK_SIZE_GROUP_HORIZONTAL</property>
      <widgets>
        <widget name="radio1"/>
        <widget name="radio2"/>
      </widgets>
    </object>
    ```
*/
class SizeGroup : gobject.object.ObjectWrap, gtk.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_size_group_get_type != &gidSymbolNotFound ? gtk_size_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SizeGroup self()
  {
    return this;
  }

  /**
      Get `ignoreHidden` property.
      Returns: If true, unmapped widgets are ignored when determining
        the size of the group.
  
      Deprecated: Measuring the size of hidden widgets has not worked
            reliably for a long time. In most cases, they will report a size
            of 0 nowadays, and thus, their size will not affect the other
            size group members. In effect, size groups will always operate
            as if this property was true. Use a #GtkStack instead to hide
            widgets while still having their size taken into account.
  */
  @property bool ignoreHidden()
  {
    return getIgnoreHidden();
  }

  /**
      Set `ignoreHidden` property.
      Params:
        propval = If true, unmapped widgets are ignored when determining
          the size of the group.
  
      Deprecated: Measuring the size of hidden widgets has not worked
            reliably for a long time. In most cases, they will report a size
            of 0 nowadays, and thus, their size will not affect the other
            size group members. In effect, size groups will always operate
            as if this property was true. Use a #GtkStack instead to hide
            widgets while still having their size taken into account.
  */
  @property void ignoreHidden(bool propval)
  {
    return setIgnoreHidden(propval);
  }

  /** */
  @property gtk.types.SizeGroupMode mode()
  {
    return getMode();
  }

  /** */
  @property void mode(gtk.types.SizeGroupMode propval)
  {
    return setMode(propval);
  }

  mixin BuildableT!();

  /**
      Create a new #GtkSizeGroup.
  
      Params:
        mode = the mode for the new size group.
      Returns: a newly created #GtkSizeGroup
  */
  this(gtk.types.SizeGroupMode mode)
  {
    GtkSizeGroup* _cretval;
    _cretval = gtk_size_group_new(mode);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a widget to a #GtkSizeGroup. In the future, the requisition
      of the widget will be determined as the maximum of its requisition
      and the requisition of the other widgets in the size group.
      Whether this applies horizontally, vertically, or in both directions
      depends on the mode of the size group. See [gtk.size_group.SizeGroup.setMode].
      
      When the widget is destroyed or no longer referenced elsewhere, it will
      be removed from the size group.
  
      Params:
        widget = the #GtkWidget to add
  */
  void addWidget(gtk.widget.Widget widget)
  {
    gtk_size_group_add_widget(cast(GtkSizeGroup*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Returns if invisible widgets are ignored when calculating the size.
      Returns: true if invisible widgets are ignored.
  
      Deprecated: Measuring the size of hidden widgets has not worked
            reliably for a long time. In most cases, they will report a size
            of 0 nowadays, and thus, their size will not affect the other
            size group members. In effect, size groups will always operate
            as if this property was true. Use a #GtkStack instead to hide
            widgets while still having their size taken into account.
  */
  bool getIgnoreHidden()
  {
    bool _retval;
    _retval = cast(bool)gtk_size_group_get_ignore_hidden(cast(GtkSizeGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current mode of the size group. See [gtk.size_group.SizeGroup.setMode].
      Returns: the current mode of the size group.
  */
  gtk.types.SizeGroupMode getMode()
  {
    GtkSizeGroupMode _cretval;
    _cretval = gtk_size_group_get_mode(cast(GtkSizeGroup*)this._cPtr);
    gtk.types.SizeGroupMode _retval = cast(gtk.types.SizeGroupMode)_cretval;
    return _retval;
  }

  /**
      Returns the list of widgets associated with size_group.
      Returns: a #GSList of
          widgets. The list is owned by GTK+ and should not be modified.
  */
  gtk.widget.Widget[] getWidgets()
  {
    GSList* _cretval;
    _cretval = gtk_size_group_get_widgets(cast(GtkSizeGroup*)this._cPtr);
    auto _retval = gSListToD!(gtk.widget.Widget, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes a widget from a #GtkSizeGroup.
  
      Params:
        widget = the #GtkWidget to remove
  */
  void removeWidget(gtk.widget.Widget widget)
  {
    gtk_size_group_remove_widget(cast(GtkSizeGroup*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether unmapped widgets should be ignored when
      calculating the size.
  
      Params:
        ignoreHidden = whether unmapped widgets should be ignored
            when calculating the size
  
      Deprecated: Measuring the size of hidden widgets has not worked
            reliably for a long time. In most cases, they will report a size
            of 0 nowadays, and thus, their size will not affect the other
            size group members. In effect, size groups will always operate
            as if this property was true. Use a #GtkStack instead to hide
            widgets while still having their size taken into account.
  */
  void setIgnoreHidden(bool ignoreHidden)
  {
    gtk_size_group_set_ignore_hidden(cast(GtkSizeGroup*)this._cPtr, ignoreHidden);
  }

  /**
      Sets the #GtkSizeGroupMode of the size group. The mode of the size
      group determines whether the widgets in the size group should
      all have the same horizontal requisition ([gtk.types.SizeGroupMode.Horizontal])
      all have the same vertical requisition ([gtk.types.SizeGroupMode.Vertical]),
      or should all have the same requisition in both directions
      ([gtk.types.SizeGroupMode.Both]).
  
      Params:
        mode = the mode to set for the size group.
  */
  void setMode(gtk.types.SizeGroupMode mode)
  {
    gtk_size_group_set_mode(cast(GtkSizeGroup*)this._cPtr, mode);
  }
}

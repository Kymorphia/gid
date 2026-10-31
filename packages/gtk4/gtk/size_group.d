/// Module for [SizeGroup] class
module gtk.size_group;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    Groups widgets together so they all request the same size.
    
    This is typically useful when you want a column of widgets to have
    the same size, but you can’t use a [gtk.grid.Grid] or [gtk.box.Box].
    
    In detail, the size requested for each widget in a [gtk.size_group.SizeGroup] is
    the maximum of the sizes that would have been requested for each
    widget in the size group if they were not in the size group. The
    [mode][gtk.size_group.SizeGroup.setMode] of the size group determines
    whether this applies to the horizontal size, the vertical size, or
    both sizes.
    
    Note that size groups only affect the amount of space requested, not
    the size that the widgets finally receive. If you want the widgets in
    a [gtk.size_group.SizeGroup] to actually be the same size, you need to pack them in
    such a way that they get the size they request and not more. In
    particular it doesn't make a lot of sense to set
    [the expand flags][gtk.widget.Widget.setHexpand] on the widgets that
    are members of a size group.
    
    [gtk.size_group.SizeGroup] objects are referenced by each widget in the size group,
    so once you have added all widgets to a [gtk.size_group.SizeGroup], you can drop
    the initial reference to the size group with
    [gobject.object.ObjectWrap.unref]. If the widgets in the size group are
    subsequently destroyed, then they will be removed from the size group
    and drop their references on the size group; when all widgets have been
    removed, the size group will be freed.
    
    Widgets can be part of multiple size groups; GTK will compute the
    horizontal size of a widget from the horizontal requisition of all widgets
    that can be reached from the widget by a chain of size groups with mode
    `enum@Gtk.SizeGroupMode.HORIZONTAL` or `enum@Gtk.SizeGroupMode.BOTH`, and
    the vertical size from the vertical requisition of all widgets that can be
    reached from the widget by a chain of size groups with mode
    `enum@Gtk.SizeGroupMode.VERTICAL` or `enum@Gtk.SizeGroupMode.BOTH`.
    
    # Size groups and trading height-for-width
    
    ::: warning
        Generally, size groups don't interact well with widgets that
        trade height for width (or width for height), such as wrappable
        labels. Avoid using size groups with such widgets.
    
    A size group with mode `enum@Gtk.SizeGroupMode.HORIZONTAL` or
    `enum@Gtk.SizeGroupMode.VERTICAL` only consults non-contextual sizes
    of widgets other than the one being measured, since it has no
    knowledge of what size a widget will get allocated in the other
    orientation. This can lead to widgets in a group actually requesting
    different contextual sizes, contrary to the purpose of
    [gtk.size_group.SizeGroup].
    
    In contrast, a size group with mode `enum@Gtk.SizeGroupMode.BOTH` can
    properly propagate the available size in the opposite orientation
    when measuring widgets in the group, which results in consistent and
    accurate measurements.
    
    In case some mechanism other than a size group is already used to
    ensure that widgets in a group all get the same size in one
    orientation (for example, some common ancestor is known to allocate
    the same width to all its children), and the size group is only
    really needed to also make the widgets request the same size in the
    other orientation, it is beneficial to still set the group's mode to
    `enum@Gtk.SizeGroupMode.BOTH`. This lets the group assume and count
    on sizes of the widgets in the former orientation being the same,
    which enables it to propagate the available size as described above.
    
    # Alternatives to size groups
    
    Size groups have many limitations, such as only influencing size
    requests but not allocations, and poor height-for-width support. When
    possible, prefer using dedicated mechanisms that can properly ensure
    that the widgets get the same size.
    
    Various container widgets and layout managers support a homogeneous
    layout mode, where they will explicitly give the same size to their
    children (see [gtk.box.Box.homogeneous]). Using homogeneous mode
    can also have large performance benefits compared to either the same
    container in non-homogeneous mode, or to size groups.
    
    [gtk.grid.Grid] can be used to position widgets into rows and
    columns. Members of each column will have the same width among them;
    likewise, members of each row will have the same height. On top of
    that, the heights can be made equal between all rows with
    [gtk.grid.Grid.rowHomogeneous], and the widths can be made equal
    between all columns with [gtk.grid.Grid.columnHomogeneous].
    
    # GtkSizeGroup as GtkBuildable
    
    Size groups can be specified in a UI definition by placing an `<object>`
    element with `class="GtkSizeGroup"` somewhere in the UI definition. The
    widgets that belong to the size group are specified by a `<widgets>` element
    that may contain multiple `<widget>` elements, one for each member of the
    size group. The ”name” attribute gives the id of the widget.
    
    An example of a UI definition fragment with [gtk.size_group.SizeGroup]:
    ```xml
    <object class="GtkSizeGroup">
      <property name="mode">horizontal</property>
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_size_group_get_type != &gidSymbolNotFound ? gtk_size_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SizeGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.size_group.SizeGroup]
      Returns: New builder object
  */
  static SizeGroupGidBuilder builder() nothrow
  {
    return new SizeGroupGidBuilder;
  }

  /**
      Get `mode` property.
      Returns: The direction in which the size group affects requested sizes.
  */
  @property gtk.types.SizeGroupMode mode() nothrow
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = The direction in which the size group affects requested sizes.
  */
  @property void mode(gtk.types.SizeGroupMode propval) nothrow
  {
    setMode(propval);
  }

  mixin BuildableT!();

  /**
      Create a new [gtk.size_group.SizeGroup].
  
      Params:
        mode = the mode for the new size group.
      Returns: a newly created [gtk.size_group.SizeGroup]
  */
  this(gtk.types.SizeGroupMode mode) nothrow
  {
    GtkSizeGroup* _cretval;
    _cretval = gtk_size_group_new(mode);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a widget to a [gtk.size_group.SizeGroup].
      
      In the future, the requisition
      of the widget will be determined as the maximum of its requisition
      and the requisition of the other widgets in the size group.
      Whether this applies horizontally, vertically, or in both directions
      depends on the mode of the size group.
      See [gtk.size_group.SizeGroup.setMode].
      
      When the widget is destroyed or no longer referenced elsewhere, it
      will be removed from the size group.
  
      Params:
        widget = the [gtk.widget.Widget] to add
  */
  void addWidget(gtk.widget.Widget widget) nothrow
  {
    gtk_size_group_add_widget(cast(GtkSizeGroup*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the current mode of the size group.
      Returns: the current mode of the size group.
  */
  gtk.types.SizeGroupMode getMode() nothrow
  {
    GtkSizeGroupMode _cretval;
    _cretval = gtk_size_group_get_mode(cast(GtkSizeGroup*)this._cPtr);
    gtk.types.SizeGroupMode _retval = cast(gtk.types.SizeGroupMode)_cretval;
    return _retval;
  }

  /**
      Returns the list of widgets associated with size_group.
      Returns: a [glib.slist.SList] of
          widgets. The list is owned by GTK and should not be modified.
  */
  gtk.widget.Widget[] getWidgets() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_size_group_get_widgets(cast(GtkSizeGroup*)this._cPtr);
    auto _retval = gSListToD!(gtk.widget.Widget, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes a widget from a [gtk.size_group.SizeGroup].
  
      Params:
        widget = the [gtk.widget.Widget] to remove
  */
  void removeWidget(gtk.widget.Widget widget) nothrow
  {
    gtk_size_group_remove_widget(cast(GtkSizeGroup*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.types.SizeGroupMode] of the size group.
      
      The mode of the size group determines whether the widgets in the
      size group should all have the same horizontal requisition
      ([gtk.types.SizeGroupMode.Horizontal]) all have the same vertical requisition
      ([gtk.types.SizeGroupMode.Vertical]), or should all have the same requisition
      in both directions ([gtk.types.SizeGroupMode.Both]).
  
      Params:
        mode = the mode to set for the size group.
  */
  void setMode(gtk.types.SizeGroupMode mode) nothrow
  {
    gtk_size_group_set_mode(cast(GtkSizeGroup*)this._cPtr, mode);
  }
}

/// Fluent builder implementation template for [gtk.size_group.SizeGroup]
class SizeGroupGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `mode` property.
      Params:
        propval = The direction in which the size group affects requested sizes.
      Returns: Builder instance for fluent chaining
  */
  T mode(gtk.types.SizeGroupMode propval) nothrow
  {
    return setProperty("mode", propval);
  }
}

/// Fluent builder for [gtk.size_group.SizeGroup]
final class SizeGroupGidBuilder : SizeGroupGidBuilderImpl!SizeGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SizeGroup build() nothrow
  {
    return new SizeGroup(cast(void*)createGObject(SizeGroup._getGType), Yes.Take);
  }
}

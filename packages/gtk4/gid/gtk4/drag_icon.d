/// Module for [DragIcon] class
module gid.gtk4.drag_icon;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.drag;
import gid.gdk4.paintable;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A [gid.gtk4.root.Root] implementation for drag icons.
    
    A drag icon moves with the pointer during a Drag-and-Drop operation
    and is destroyed when the drag ends.
    
    To set up a drag icon and associate it with an ongoing drag operation,
    use [gid.gtk4.drag_icon.DragIcon.getForDrag] to get the icon for a drag. You can
    then use it like any other widget and use [gid.gtk4.drag_icon.DragIcon.setChild]
    to set whatever widget should be used for the drag icon.
    
    Keep in mind that drag icons do not allow user input.
*/
class DragIcon : gid.gtk4.widget.Widget, gid.gtk4.native.Native, gid.gtk4.root.Root
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_drag_icon_get_type != &gidSymbolNotFound ? gtk_drag_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkDragIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override DragIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.drag_icon.DragIcon]
      Returns: New builder object
  */
  static DragIconGidBuilder builder() nothrow
  {
    return new DragIconGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The widget to display as drag icon.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The widget to display as drag icon.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  mixin NativeT!();
  mixin RootT!();

  /**
      Gets the [gid.gtk4.drag_icon.DragIcon] in use with drag.
      
      If no drag icon exists yet, a new one will be created
      and shown.
  
      Params:
        drag = a [gid.gdk4.drag.Drag]
      Returns: the [gid.gtk4.drag_icon.DragIcon]
  */
  static gid.gtk4.drag_icon.DragIcon getForDrag(gid.gdk4.drag.Drag drag) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_drag_icon_get_for_drag(drag ? cast(GdkDrag*)drag._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.drag_icon.DragIcon)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a widget that can be used as a drag icon for the given
      value.
      
      Supported types include strings, [gid.gdk4.rgba.RGBA] and [gid.gtk4.text_buffer.TextBuffer].
      If GTK does not know how to create a widget for a given value,
      it will return null.
      
      This method is used to set the default drag icon on drag-and-drop
      operations started by [gid.gtk4.drag_source.DragSource], so you don't need to set
      a drag icon using this function there.
  
      Params:
        value = a [gid.gobject2.value.Value]
      Returns: A new [gid.gtk4.widget.Widget]
          for displaying value as a drag icon.
  */
  static gid.gtk4.widget.Widget createWidgetForValue(gid.gobject2.value.Value value) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_drag_icon_create_widget_for_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.drag_icon.DragIcon] that shows paintable, and associates
      it with the drag operation.
      
      The hotspot position on the paintable is aligned with the
      hotspot of the cursor.
  
      Params:
        drag = a [gid.gdk4.drag.Drag]
        paintable = a [gid.gdk4.paintable.Paintable] to display
        hotX = X coordinate of the hotspot
        hotY = Y coordinate of the hotspot
  */
  static void setFromPaintable(gid.gdk4.drag.Drag drag, gid.gdk4.paintable.Paintable paintable, int hotX, int hotY) nothrow
  {
    gtk_drag_icon_set_from_paintable(drag ? cast(GdkDrag*)drag._cPtr(No.Dup) : null, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null, hotX, hotY);
  }

  /**
      Gets the widget currently used as drag icon.
      Returns: The drag icon
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_drag_icon_get_child(cast(GtkDragIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the widget to display as the drag icon.
  
      Params:
        child = a [gid.gtk4.widget.Widget]
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_drag_icon_set_child(cast(GtkDragIcon*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.drag_icon.DragIcon]
class DragIconGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.native.NativeGidBuilderImpl!T, gid.gtk4.root.RootGidBuilderImpl!T
{

  mixin NativeGidBuilderT!();
  mixin RootGidBuilderT!();

  /**
      Set `child` property.
      Params:
        propval = The widget to display as drag icon.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.gtk4.drag_icon.DragIcon]
final class DragIconGidBuilder : DragIconGidBuilderImpl!DragIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DragIcon build() nothrow
  {
    return new DragIcon(cast(void*)createGObject(DragIcon._getGType), Yes.Take);
  }
}

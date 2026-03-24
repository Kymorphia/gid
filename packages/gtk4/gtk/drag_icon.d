/// Module for [DragIcon] class
module gtk.drag_icon;

import gdk.drag;
import gdk.paintable;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.value;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.drag_icon.DragIcon] is a [gtk.root.Root] implementation for drag icons.
    
    A drag icon moves with the pointer during a Drag-and-Drop operation
    and is destroyed when the drag ends.
    
    To set up a drag icon and associate it with an ongoing drag operation,
    use [gtk.drag_icon.DragIcon.getForDrag] to get the icon for a drag. You can
    then use it like any other widget and use [gtk.drag_icon.DragIcon.setChild]
    to set whatever widget should be used for the drag icon.
    
    Keep in mind that drag icons do not allow user input.
*/
class DragIcon : gtk.widget.Widget, gtk.native.Native, gtk.root.Root
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
    return cast(void function())gtk_drag_icon_get_type != &gidSymbolNotFound ? gtk_drag_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DragIcon self()
  {
    return this;
  }

  /**
  Get builder for [gtk.drag_icon.DragIcon]
  Returns: New builder object
  */
  static DragIconGidBuilder builder()
  {
    return new DragIconGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The widget to display as drag icon.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The widget to display as drag icon.
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  mixin NativeT!();
  mixin RootT!();

  /**
      Creates a widget that can be used as a drag icon for the given
      value.
      
      Supported types include strings, [gdk.rgba.RGBA] and [gtk.text_buffer.TextBuffer].
      If GTK does not know how to create a widget for a given value,
      it will return null.
      
      This method is used to set the default drag icon on drag-and-drop
      operations started by [gtk.drag_source.DragSource], so you don't need to set
      a drag icon using this function there.
  
      Params:
        value = a [gobject.value.Value]
      Returns: A new [gtk.widget.Widget]
          for displaying value as a drag icon.
  */
  static gtk.widget.Widget createWidgetForValue(gobject.value.Value value)
  {
    GtkWidget* _cretval;
    _cretval = gtk_drag_icon_create_widget_for_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the [gtk.drag_icon.DragIcon] in use with drag.
      
      If no drag icon exists yet, a new one will be created
      and shown.
  
      Params:
        drag = a [gdk.drag.Drag]
      Returns: the [gtk.drag_icon.DragIcon]
  */
  static gtk.widget.Widget getForDrag(gdk.drag.Drag drag)
  {
    GtkWidget* _cretval;
    _cretval = gtk_drag_icon_get_for_drag(drag ? cast(GdkDrag*)drag._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.drag_icon.DragIcon] that shows paintable, and associates
      it with the drag operation.
      
      The hotspot position on the paintable is aligned with the
      hotspot of the cursor.
  
      Params:
        drag = a [gdk.drag.Drag]
        paintable = a [gdk.paintable.Paintable] to display
        hotX = X coordinate of the hotspot
        hotY = Y coordinate of the hotspot
  */
  static void setFromPaintable(gdk.drag.Drag drag, gdk.paintable.Paintable paintable, int hotX, int hotY)
  {
    gtk_drag_icon_set_from_paintable(drag ? cast(GdkDrag*)drag._cPtr(No.Dup) : null, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null, hotX, hotY);
  }

  /**
      Gets the widget currently used as drag icon.
      Returns: The drag icon
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_drag_icon_get_child(cast(GtkDragIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the widget to display as the drag icon.
  
      Params:
        child = a [gtk.widget.Widget]
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_drag_icon_set_child(cast(GtkDragIcon*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

class DragIconGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.native.NativeGidBuilderImpl!T, gtk.root.RootGidBuilderImpl!T
{

  mixin NativeGidBuilderT!();
  mixin RootGidBuilderT!();

  /**
      Set `child` property.
      Params:
        propval = The widget to display as drag icon.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gtk.drag_icon.DragIcon]
final class DragIconGidBuilder : DragIconGidBuilderImpl!DragIconGidBuilder
{
  DragIcon build()
  {
    return new DragIcon(cast(void*)createGObject(DragIcon._getGType), No.Take);
  }
}

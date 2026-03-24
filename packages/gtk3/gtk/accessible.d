/// Module for [Accessible] class
module gtk.accessible;

import atk.object;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    The #GtkAccessible class is the base class for accessible
    implementations for #GtkWidget subclasses. It is a thin
    wrapper around #AtkObject, which adds facilities for associating
    a widget with its accessible object.
    
    An accessible implementation for a third-party widget should
    derive from #GtkAccessible and implement the suitable interfaces
    from ATK, such as #AtkText or #AtkSelection. To establish
    the connection between the widget class and its corresponding
    acccessible implementation, override the get_accessible vfunc
    in #GtkWidgetClass.
*/
class Accessible : atk.object.ObjectWrap
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
    return cast(void function())gtk_accessible_get_type != &gidSymbolNotFound ? gtk_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Accessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.accessible.Accessible]
  Returns: New builder object
  */
  static AccessibleGidBuilder builder()
  {
    return new AccessibleGidBuilder;
  }

  /** */
  @property gtk.widget.Widget widget()
  {
    return getWidget();
  }

  /** */
  @property void widget(gtk.widget.Widget propval)
  {
    setWidget(propval);
  }

  /**
      This function specifies the callback function to be called
      when the widget corresponding to a GtkAccessible is destroyed.
  
      Deprecated: Use [gtk.accessible.Accessible.setWidget] and its vfuncs.
  */
  void connectWidgetDestroyed()
  {
    gtk_accessible_connect_widget_destroyed(cast(GtkAccessible*)this._cPtr);
  }

  /**
      Gets the #GtkWidget corresponding to the #GtkAccessible.
      The returned widget does not have a reference added, so
      you do not need to unref it.
      Returns: pointer to the #GtkWidget
            corresponding to the #GtkAccessible, or null.
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_accessible_get_widget(cast(GtkAccessible*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the #GtkWidget corresponding to the #GtkAccessible.
      
      accessible will not hold a reference to widget.
      It is the caller’s responsibility to ensure that when widget
      is destroyed, the widget is unset by calling this function
      again with widget set to null.
  
      Params:
        widget = a #GtkWidget or null to unset
  */
  void setWidget(gtk.widget.Widget widget = null)
  {
    gtk_accessible_set_widget(cast(GtkAccessible*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

class AccessibleGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T widget(gtk.widget.Widget propval)
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gtk.accessible.Accessible]
final class AccessibleGidBuilder : AccessibleGidBuilderImpl!AccessibleGidBuilder
{
  Accessible build()
  {
    return new Accessible(cast(void*)createGObject(Accessible._getGType), No.Take);
  }
}

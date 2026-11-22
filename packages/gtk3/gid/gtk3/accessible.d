/// Module for [Accessible] class
module gid.gtk3.accessible;

public import gid.core.basictypes;
import gid.atk1.object;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

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
class Accessible : gid.atk1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_get_type != &gidSymbolNotFound ? gtk_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override Accessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.accessible.Accessible]
      Returns: New builder object
  */
  static AccessibleGidBuilder builder() nothrow
  {
    return new AccessibleGidBuilder;
  }

  /** */
  @property gid.gtk3.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /** */
  @property void widget(gid.gtk3.widget.Widget propval) nothrow
  {
    setWidget(propval);
  }

  /**
      This function specifies the callback function to be called
      when the widget corresponding to a GtkAccessible is destroyed.
  
      Deprecated: Use [gid.gtk3.accessible.Accessible.setWidget] and its vfuncs.
  */
  void connectWidgetDestroyed() nothrow
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
  gid.gtk3.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_accessible_get_widget(cast(GtkAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
  void setWidget(gid.gtk3.widget.Widget widget = null) nothrow
  {
    gtk_accessible_set_widget(cast(GtkAccessible*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.accessible.Accessible]
class AccessibleGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T widget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gid.gtk3.accessible.Accessible]
final class AccessibleGidBuilder : AccessibleGidBuilderImpl!AccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Accessible build() nothrow
  {
    return new Accessible(cast(void*)createGObject(Accessible._getGType), Yes.Take);
  }
}

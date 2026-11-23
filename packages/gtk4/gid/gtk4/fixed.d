/// Module for [Fixed] class
module gid.gtk4.fixed;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gsk4.transform;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Places its child widgets at fixed positions and with fixed sizes.
    
    [gid.gtk4.fixed.Fixed] performs no automatic layout management.
    
    For most applications, you should not use this container! It keeps
    you from having to learn about the other GTK containers, but it
    results in broken applications.  With [gid.gtk4.fixed.Fixed], the following
    things will result in truncated text, overlapping widgets, and
    other display bugs:
    
    - Themes, which may change widget sizes.
    
    - Fonts other than the one you used to write the app will of course
      change the size of widgets containing text; keep in mind that
      users may use a larger font because of difficulty reading the
      default, or they may be using a different OS that provides different fonts.
    
    - Translation of text into other languages changes its size. Also,
      display of non-English text will use a different font in many
      cases.
    
    In addition, [gid.gtk4.fixed.Fixed] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately for the text direction, e.g. to put labels to
    the right of the thing they label when using an RTL language, but it can’t
    do that with [gid.gtk4.fixed.Fixed]. So if you need to reorder widgets depending on
    the text direction, you would need to manually detect it and adjust child
    positions accordingly.
    
    Finally, fixed positioning makes it kind of annoying to add/remove
    UI elements, since you have to reposition all the other elements. This
    is a long-term maintenance problem for your application.
    
    If you know none of these things are an issue for your application,
    and prefer the simplicity of [gid.gtk4.fixed.Fixed], by all means use the
    widget. But you should be aware of the tradeoffs.
*/
class Fixed : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_fixed_get_type != &gidSymbolNotFound ? gtk_fixed_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFixed";
  }

  /** Returns `this`, for use in `with` statements. */
  override Fixed self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.fixed.Fixed]
      Returns: New builder object
  */
  static FixedGidBuilder builder() nothrow
  {
    return new FixedGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.fixed.Fixed].
      Returns: a new [gid.gtk4.fixed.Fixed].
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_fixed_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieves the translation transformation of the
      given child [gid.gtk4.widget.Widget] in the [gid.gtk4.fixed.Fixed].
      
      See also: [gid.gtk4.fixed.Fixed.getChildTransform].
  
      Params:
        widget = a child of fixed
        x = the horizontal position of the widget
        y = the vertical position of the widget
  */
  void getChildPosition(gid.gtk4.widget.Widget widget, out double x, out double y) nothrow
  {
    gtk_fixed_get_child_position(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y);
  }

  /**
      Retrieves the transformation for widget set using
      [gid.gtk4.fixed.Fixed.setChildTransform].
  
      Params:
        widget = a [gid.gtk4.widget.Widget], child of fixed
      Returns: a [gid.gsk4.transform.Transform]
  */
  gid.gsk4.transform.Transform getChildTransform(gid.gtk4.widget.Widget widget) nothrow
  {
    GskTransform* _cretval;
    _cretval = gtk_fixed_get_child_transform(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gsk4.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets a translation transformation to the given `x` and `y`
      coordinates to the child widget of the [gid.gtk4.fixed.Fixed].
  
      Params:
        widget = the child widget
        x = the horizontal position to move the widget to
        y = the vertical position to move the widget to
  */
  void move(gid.gtk4.widget.Widget widget, double x, double y) nothrow
  {
    gtk_fixed_move(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, x, y);
  }

  /**
      Adds a widget to a [gid.gtk4.fixed.Fixed] at the given position.
  
      Params:
        widget = the widget to add
        x = the horizontal position to place the widget at
        y = the vertical position to place the widget at
  */
  void put(gid.gtk4.widget.Widget widget, double x, double y) nothrow
  {
    gtk_fixed_put(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, x, y);
  }

  /**
      Removes a child from fixed.
  
      Params:
        widget = the child widget to remove
  */
  void remove(gid.gtk4.widget.Widget widget) nothrow
  {
    gtk_fixed_remove(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the transformation for widget.
      
      This is a convenience function that retrieves the
      [gid.gtk4.fixed_layout_child.FixedLayoutChild] instance associated to
      widget and calls [gid.gtk4.fixed_layout_child.FixedLayoutChild.setTransform].
  
      Params:
        widget = a [gid.gtk4.widget.Widget], child of fixed
        transform = the transformation assigned to widget
            to reset widget's transform
  */
  void setChildTransform(gid.gtk4.widget.Widget widget, gid.gsk4.transform.Transform transform = null) nothrow
  {
    gtk_fixed_set_child_transform(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, transform ? cast(GskTransform*)transform._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.fixed.Fixed]
class FixedGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk4.fixed.Fixed]
final class FixedGidBuilder : FixedGidBuilderImpl!FixedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Fixed build() nothrow
  {
    return new Fixed(cast(void*)createGObject(Fixed._getGType), Yes.Take);
  }
}

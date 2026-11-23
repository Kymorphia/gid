/// Module for [Invisible] class
module gid.gtk3.invisible;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.screen;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkInvisible widget is used internally in GTK+, and is probably not
    very useful for application developers.
    
    It is used for reliable pointer grabs and selection handling in the code
    for drag-and-drop.
*/
class Invisible : gid.gtk3.widget.Widget
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
    return cast(void function())gtk_invisible_get_type != &gidSymbolNotFound ? gtk_invisible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkInvisible";
  }

  /** Returns `this`, for use in `with` statements. */
  override Invisible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.invisible.Invisible]
      Returns: New builder object
  */
  static InvisibleGidBuilder builder() nothrow
  {
    return new InvisibleGidBuilder;
  }

  /** */
  @property gid.gdk3.screen.Screen screen() nothrow
  {
    return getScreen();
  }

  /** */
  @property void screen(gid.gdk3.screen.Screen propval) nothrow
  {
    setScreen(propval);
  }

  /**
      Creates a new #GtkInvisible.
      Returns: a new #GtkInvisible.
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
      _cretval = gtk_invisible_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkInvisible object for a specified screen
  
      Params:
        screen = a #GdkScreen which identifies on which
              the new #GtkInvisible will be created.
      Returns: a newly created #GtkInvisible object
  */
  static gid.gtk3.invisible.Invisible newForScreen(gid.gdk3.screen.Screen screen) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_invisible_new_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.invisible.Invisible)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkScreen object associated with invisible
      Returns: the associated #GdkScreen.
  */
  override gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_invisible_get_screen(cast(GtkInvisible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the #GdkScreen where the #GtkInvisible object will be displayed.
  
      Params:
        screen = a #GdkScreen.
  */
  void setScreen(gid.gdk3.screen.Screen screen) nothrow
  {
    gtk_invisible_set_screen(cast(GtkInvisible*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.invisible.Invisible]
class InvisibleGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T
{


  /** */
  T screen(gid.gdk3.screen.Screen propval) nothrow
  {
    return setProperty("screen", propval);
  }
}

/// Fluent builder for [gid.gtk3.invisible.Invisible]
final class InvisibleGidBuilder : InvisibleGidBuilderImpl!InvisibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Invisible build() nothrow
  {
    return new Invisible(cast(void*)createGObject(Invisible._getGType), Yes.Take);
  }
}

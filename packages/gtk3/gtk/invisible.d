/// Module for [Invisible] class
module gtk.invisible;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.screen;
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
    The #GtkInvisible widget is used internally in GTK+, and is probably not
    very useful for application developers.
    
    It is used for reliable pointer grabs and selection handling in the code
    for drag-and-drop.
*/
class Invisible : gtk.widget.Widget
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
    return cast(void function())gtk_invisible_get_type != &gidSymbolNotFound ? gtk_invisible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Invisible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.invisible.Invisible]
      Returns: New builder object
  */
  static InvisibleGidBuilder builder()
  {
    return new InvisibleGidBuilder;
  }

  /** */
  @property gdk.screen.Screen screen()
  {
    return getScreen();
  }

  /** */
  @property void screen(gdk.screen.Screen propval)
  {
    setScreen(propval);
  }

  /**
      Creates a new #GtkInvisible.
      Returns: a new #GtkInvisible.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_invisible_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkInvisible object for a specified screen
  
      Params:
        screen = a #GdkScreen which identifies on which
              the new #GtkInvisible will be created.
      Returns: a newly created #GtkInvisible object
  */
  static gtk.invisible.Invisible newForScreen(gdk.screen.Screen screen)
  {
    GtkWidget* _cretval;
    _cretval = gtk_invisible_new_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.invisible.Invisible)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkScreen object associated with invisible
      Returns: the associated #GdkScreen.
  */
  override gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gtk_invisible_get_screen(cast(GtkInvisible*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the #GdkScreen where the #GtkInvisible object will be displayed.
  
      Params:
        screen = a #GdkScreen.
  */
  void setScreen(gdk.screen.Screen screen)
  {
    gtk_invisible_set_screen(cast(GtkInvisible*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.invisible.Invisible]
class InvisibleGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /** */
  T screen(gdk.screen.Screen propval)
  {
    return setProperty("screen", propval);
  }
}

/// Fluent builder for [gtk.invisible.Invisible]
final class InvisibleGidBuilder : InvisibleGidBuilderImpl!InvisibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Invisible build()
  {
    return new Invisible(cast(void*)createGObject(Invisible._getGType), No.Take);
  }
}

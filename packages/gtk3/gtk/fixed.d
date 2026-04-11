/// Module for [Fixed] class
module gtk.fixed;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    The #GtkFixed widget is a container which can place child widgets
    at fixed positions and with fixed sizes, given in pixels. #GtkFixed
    performs no automatic layout management.
    
    For most applications, you should not use this container! It keeps
    you from having to learn about the other GTK+ containers, but it
    results in broken applications.  With #GtkFixed, the following
    things will result in truncated text, overlapping widgets, and
    other display bugs:
    
    $(LIST
      * Themes, which may change widget sizes.
      
      * Fonts other than the one you used to write the app will of course
        change the size of widgets containing text; keep in mind that
        users may use a larger font because of difficulty reading the
        default, or they may be using a different OS that provides different fonts.
      
      * Translation of text into other languages changes its size. Also,
        display of non-English text will use a different font in many
        cases.
    )
      
    In addition, #GtkFixed does not pay attention to text direction and thus may
    produce unwanted results if your app is run under right-to-left languages
    such as Hebrew or Arabic. That is: normally GTK+ will order containers
    appropriately for the text direction, e.g. to put labels to the right of the
    thing they label when using an RTL language, but it can’t do that with
    #GtkFixed. So if you need to reorder widgets depending on the text direction,
    you would need to manually detect it and adjust child positions accordingly.
    
    Finally, fixed positioning makes it kind of annoying to add/remove
    GUI elements, since you have to reposition all the other
    elements. This is a long-term maintenance problem for your
    application.
    
    If you know none of these things are an issue for your application,
    and prefer the simplicity of #GtkFixed, by all means use the
    widget. But you should be aware of the tradeoffs.
    
    See also #GtkLayout, which shares the ability to perform fixed positioning
    of child widgets and additionally adds custom drawing and scrollability.
*/
class Fixed : gtk.container.Container
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
    return cast(void function())gtk_fixed_get_type != &gidSymbolNotFound ? gtk_fixed_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Fixed self()
  {
    return this;
  }

  /**
      Get builder for [gtk.fixed.Fixed]
      Returns: New builder object
  */
  static FixedGidBuilder builder()
  {
    return new FixedGidBuilder;
  }

  /**
      Creates a new #GtkFixed.
      Returns: a new #GtkFixed.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_fixed_new();
    this(_cretval, No.Take);
  }

  /**
      Moves a child of a #GtkFixed container to the given position.
  
      Params:
        widget = the child widget.
        x = the horizontal position to move the widget to.
        y = the vertical position to move the widget to.
  */
  void move(gtk.widget.Widget widget, int x, int y)
  {
    gtk_fixed_move(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, x, y);
  }

  /**
      Adds a widget to a #GtkFixed container at the given position.
  
      Params:
        widget = the widget to add.
        x = the horizontal position to place the widget at.
        y = the vertical position to place the widget at.
  */
  void put(gtk.widget.Widget widget, int x, int y)
  {
    gtk_fixed_put(cast(GtkFixed*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, x, y);
  }
}

/// Fluent builder implementation template for [gtk.fixed.Fixed]
class FixedGidBuilderImpl(T) : gtk.container.ContainerGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.fixed.Fixed]
final class FixedGidBuilder : FixedGidBuilderImpl!FixedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Fixed build()
  {
    return new Fixed(cast(void*)createGObject(Fixed._getGType), No.Take);
  }
}

/// Module for [Bin] class
module gtk.bin;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    The #GtkBin widget is a container with just one child.
    It is not very useful itself, but it is useful for deriving subclasses,
    since it provides common code needed for handling a single child widget.
    
    Many GTK+ widgets are subclasses of #GtkBin, including #GtkWindow,
    #GtkButton, #GtkFrame, #GtkHandleBox or #GtkScrolledWindow.
*/
class Bin : gtk.container.Container
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
    return cast(void function())gtk_bin_get_type != &gidSymbolNotFound ? gtk_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Bin self()
  {
    return this;
  }

  /**
  Get builder for [gtk.bin.Bin]
  Returns: New builder object
  */
  static BinGidBuilder builder()
  {
    return new BinGidBuilder;
  }

  /**
      Gets the child of the #GtkBin, or null if the bin contains
      no child widget. The returned widget does not have a reference
      added, so you do not need to unref it.
      Returns: the child of bin, or null if it does
        not have a child.
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_bin_get_child(cast(GtkBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

class BinGidBuilderImpl(T) : gtk.container.ContainerGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.bin.Bin]
final class BinGidBuilder : BinGidBuilderImpl!BinGidBuilder
{
  Bin build()
  {
    return new Bin(cast(void*)createGObject(Bin._getGType), No.Take);
  }
}

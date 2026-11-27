/// Module for [Bin] class
module gid.gtk3.bin;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkBin widget is a container with just one child.
    It is not very useful itself, but it is useful for deriving subclasses,
    since it provides common code needed for handling a single child widget.
    
    Many GTK+ widgets are subclasses of #GtkBin, including #GtkWindow,
    #GtkButton, #GtkFrame, #GtkHandleBox or #GtkScrolledWindow.
*/
@gidGir("Bin", "BinClass")
class Bin : gid.gtk3.container.Container
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_bin_get_type != &gidSymbolNotFound ? gtk_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBin";
  }

  /** Returns `this`, for use in `with` statements. */
  override Bin self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.bin.Bin]
      Returns: New builder object
  */
  static BinGidBuilder builder() nothrow
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
  gid.gtk3.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_bin_get_child(cast(GtkBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.bin.Bin]
class BinGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.bin.Bin]
final class BinGidBuilder : BinGidBuilderImpl!BinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Bin build() nothrow
  {
    return new Bin(cast(void*)createGObject(Bin._getGType), Yes.Take);
  }
}

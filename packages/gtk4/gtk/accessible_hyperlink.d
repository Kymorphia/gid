/// Module for [AccessibleHyperlink] class
module gtk.accessible_hyperlink;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_hypertext;
import gtk.accessible_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Represents a link (i.e. a uri).
    
    A widget that contains one or more links should implement
    the [gtk.accessible_hypertext.AccessibleHypertext] interface and return
    [gtk.accessible_hyperlink.AccessibleHyperlink] objects for each of the links.
*/
class AccessibleHyperlink : gobject.object.ObjectWrap, gtk.accessible.Accessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_hyperlink_get_type != &gidSymbolNotFound ? gtk_accessible_hyperlink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AccessibleHyperlink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.accessible_hyperlink.AccessibleHyperlink]
      Returns: New builder object
  */
  static AccessibleHyperlinkGidBuilder builder() nothrow
  {
    return new AccessibleHyperlinkGidBuilder;
  }

  mixin AccessibleT!();

  /**
      Creates an accessible object that represents a hyperlink.
      
      This is meant to be used with an implementation of the
      [gtk.accessible_hypertext.AccessibleHypertext] interface.
  
      Params:
        parent = the parent
        index = the index of this link in the parent
        uri = the uri
        bounds = the text range that the link occupies (or 0, 0)
      Returns: 
  */
  this(gtk.accessible_hypertext.AccessibleHypertext parent, uint index, string uri, gtk.types.AccessibleTextRange bounds) nothrow
  {
    GtkAccessibleHyperlink* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_accessible_hyperlink_new(parent ? cast(GtkAccessibleHypertext*)(cast(gobject.object.ObjectWrap)parent)._cPtr(No.Dup) : null, index, _uri, cast(GtkAccessibleTextRange*)&bounds);
    this(_cretval, Yes.Take);
  }

  /**
      Sets a platform state on the accessible.
  
      Params:
        state = the platform state to change
        enabled = the new value for the platform state
  */
  void setPlatformState(gtk.types.AccessiblePlatformState state, bool enabled) nothrow
  {
    gtk_accessible_hyperlink_set_platform_state(cast(GtkAccessibleHyperlink*)this._cPtr, state, enabled);
  }
}

/// Fluent builder implementation template for [gtk.accessible_hyperlink.AccessibleHyperlink]
class AccessibleHyperlinkGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.accessible.AccessibleGidBuilderImpl!T
{

  mixin AccessibleGidBuilderT!();
}

/// Fluent builder for [gtk.accessible_hyperlink.AccessibleHyperlink]
final class AccessibleHyperlinkGidBuilder : AccessibleHyperlinkGidBuilderImpl!AccessibleHyperlinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AccessibleHyperlink build() nothrow
  {
    return new AccessibleHyperlink(cast(void*)createGObject(AccessibleHyperlink._getGType), Yes.Take);
  }
}

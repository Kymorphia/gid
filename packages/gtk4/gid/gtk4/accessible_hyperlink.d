/// Module for [AccessibleHyperlink] class
module gid.gtk4.accessible_hyperlink;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_hypertext;
import gid.gtk4.accessible_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Represents a link (i.e. a uri).
    
    A widget that contains one or more links should implement
    the [gid.gtk4.accessible_hypertext.AccessibleHypertext] interface and return
    [gid.gtk4.accessible_hyperlink.AccessibleHyperlink] objects for each of the links.
*/
class AccessibleHyperlink : gid.gobject2.object.ObjectWrap, gid.gtk4.accessible.Accessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_hyperlink_get_type != &gidSymbolNotFound ? gtk_accessible_hyperlink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAccessibleHyperlink";
  }

  /** Returns `this`, for use in `with` statements. */
  override AccessibleHyperlink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.accessible_hyperlink.AccessibleHyperlink]
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
      [gid.gtk4.accessible_hypertext.AccessibleHypertext] interface.
  
      Params:
        parent = the parent
        index = the index of this link in the parent
        uri = the uri
        bounds = the text range that the link occupies (or 0, 0)
      Returns: 
  */
  this(gid.gtk4.accessible_hypertext.AccessibleHypertext parent, uint index, string uri, gid.gtk4.types.AccessibleTextRange bounds) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkAccessibleHyperlink* _cretval;
      const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_accessible_hyperlink_new(parent ? cast(GtkAccessibleHypertext*)(cast(gid.gobject2.object.ObjectWrap)parent)._cPtr(No.Dup) : null, index, _uri, cast(GtkAccessibleTextRange*)&bounds);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Sets a platform state on the accessible.
  
      Params:
        state = the platform state to change
        enabled = the new value for the platform state
  */
  void setPlatformState(gid.gtk4.types.AccessiblePlatformState state, bool enabled) nothrow
  {
    gtk_accessible_hyperlink_set_platform_state(cast(GtkAccessibleHyperlink*)this._cPtr, state, enabled);
  }
}

/// Fluent builder implementation template for [gid.gtk4.accessible_hyperlink.AccessibleHyperlink]
class AccessibleHyperlinkGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk4.accessible.AccessibleGidBuilderImpl!T
{

  mixin AccessibleGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.accessible_hyperlink.AccessibleHyperlink]
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

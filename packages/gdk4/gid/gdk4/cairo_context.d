/// Module for [CairoContext] class
module gid.gdk4.cairo_context;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.draw_context;
import gid.gdk4.types;
import gid.gobject2.gid_builder;

/**
    Represents the platform-specific draw context.
    
    [gid.gdk4.cairo_context.CairoContext]s are created for a surface using
    [gid.gdk4.surface.Surface.createCairoContext], and the context
    can then be used to draw on that surface.
*/
class CairoContext : gid.gdk4.draw_context.DrawContext
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
    return cast(void function())gdk_cairo_context_get_type != &gidSymbolNotFound ? gdk_cairo_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkCairoContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override CairoContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.cairo_context.CairoContext]
      Returns: New builder object
  */
  static CairoContextGidBuilder builder() nothrow
  {
    return new CairoContextGidBuilder;
  }

  /**
      Retrieves a Cairo context to be used to draw on the [gid.gdk4.surface.Surface]
      of context.
      
      A call to [gid.gdk4.draw_context.DrawContext.beginFrame] with this
      context must have been done or this function will return null.
      
      The returned context is guaranteed to be valid until
      [gid.gdk4.draw_context.DrawContext.endFrame] is called.
      Returns: a Cairo context
          to draw on `GdkSurface
  
      Deprecated: Drawing content with Cairo should be done via
          Cairo rendernodes, not by using renderers.
  */
  gid.cairo1.context.Context cairoCreate() nothrow
  {
    cairo_t* _cretval;
    _cretval = gdk_cairo_context_cairo_create(cast(GdkCairoContext*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk4.cairo_context.CairoContext]
class CairoContextGidBuilderImpl(T) : gid.gdk4.draw_context.DrawContextGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdk4.cairo_context.CairoContext]
final class CairoContextGidBuilder : CairoContextGidBuilderImpl!CairoContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CairoContext build() nothrow
  {
    return new CairoContext(cast(void*)createGObject(CairoContext._getGType), Yes.Take);
  }
}

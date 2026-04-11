/// Module for [Inhibitor] class
module panel.inhibitor;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/** */
class Inhibitor : gobject.object.ObjectWrap
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
    return cast(void function())panel_inhibitor_get_type != &gidSymbolNotFound ? panel_inhibitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Inhibitor self()
  {
    return this;
  }

  /**
      Get builder for [panel.inhibitor.Inhibitor]
      Returns: New builder object
  */
  static InhibitorGidBuilder builder()
  {
    return new InhibitorGidBuilder;
  }

  /** */
  void uninhibit()
  {
    panel_inhibitor_uninhibit(cast(PanelInhibitor*)this._cPtr);
  }
}

/// Fluent builder implementation template for [panel.inhibitor.Inhibitor]
class InhibitorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [panel.inhibitor.Inhibitor]
final class InhibitorGidBuilder : InhibitorGidBuilderImpl!InhibitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Inhibitor build()
  {
    return new Inhibitor(cast(void*)createGObject(Inhibitor._getGType), No.Take);
  }
}

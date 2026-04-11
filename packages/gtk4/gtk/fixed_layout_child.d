/// Module for [FixedLayoutChild] class
module gtk.fixed_layout_child;

import gid.gid;
import gobject.gid_builder;
import gsk.transform;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.fixed_layout.FixedLayout].
*/
class FixedLayoutChild : gtk.layout_child.LayoutChild
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
    return cast(void function())gtk_fixed_layout_child_get_type != &gidSymbolNotFound ? gtk_fixed_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedLayoutChild self()
  {
    return this;
  }

  /**
      Get builder for [gtk.fixed_layout_child.FixedLayoutChild]
      Returns: New builder object
  */
  static FixedLayoutChildGidBuilder builder()
  {
    return new FixedLayoutChildGidBuilder;
  }

  /**
      Get `transform` property.
      Returns: The transform of the child.
  */
  @property gsk.transform.Transform transform()
  {
    return getTransform();
  }

  /**
      Set `transform` property.
      Params:
        propval = The transform of the child.
  */
  @property void transform(gsk.transform.Transform propval)
  {
    setTransform(propval);
  }

  /**
      Retrieves the transformation of the child.
      Returns: a [gsk.transform.Transform]
  */
  gsk.transform.Transform getTransform()
  {
    GskTransform* _cretval;
    _cretval = gtk_fixed_layout_child_get_transform(cast(GtkFixedLayoutChild*)this._cPtr);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the transformation of the child of a [gtk.fixed_layout.FixedLayout].
  
      Params:
        transform = a [gsk.transform.Transform]
  */
  void setTransform(gsk.transform.Transform transform)
  {
    gtk_fixed_layout_child_set_transform(cast(GtkFixedLayoutChild*)this._cPtr, transform ? cast(GskTransform*)transform._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.fixed_layout_child.FixedLayoutChild]
class FixedLayoutChildGidBuilderImpl(T) : gtk.layout_child.LayoutChildGidBuilderImpl!T
{

  /**
      Set `transform` property.
      Params:
        propval = The transform of the child.
      Returns: Builder instance for fluent chaining
  */
  T transform(gsk.transform.Transform propval)
  {
    return setProperty("transform", propval);
  }
}

/// Fluent builder for [gtk.fixed_layout_child.FixedLayoutChild]
final class FixedLayoutChildGidBuilder : FixedLayoutChildGidBuilderImpl!FixedLayoutChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedLayoutChild build()
  {
    return new FixedLayoutChild(cast(void*)createGObject(FixedLayoutChild._getGType), No.Take);
  }
}

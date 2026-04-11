/// Module for [Fragment] class
module arrowdataset.fragment;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Fragment : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_fragment_get_type != &gidSymbolNotFound ? gadataset_fragment_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Fragment self()
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.fragment.Fragment]
      Returns: New builder object
  */
  static FragmentGidBuilder builder()
  {
    return new FragmentGidBuilder;
  }
}

/// Fluent builder implementation template for [arrowdataset.fragment.Fragment]
class FragmentGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T fragment(void* propval)
  {
    return setProperty("fragment", propval);
  }
}

/// Fluent builder for [arrowdataset.fragment.Fragment]
final class FragmentGidBuilder : FragmentGidBuilderImpl!FragmentGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Fragment build()
  {
    return new Fragment(cast(void*)createGObject(Fragment._getGType), No.Take);
  }
}

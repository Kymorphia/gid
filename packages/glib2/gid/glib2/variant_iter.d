/// Module for [VariantIter] class
module gid.glib2.variant_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;
import gid.glib2.variant;

/**
    #GVariantIter is an opaque data structure and can only be accessed
    using the following functions.
*/
class VariantIter : OpaqueWrap!(GVariantIter*, g_variant_iter_free, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Queries the number of child items in the container that we are
      iterating over.  This is the total number of items -- not the number
      of items remaining.
      
      This function might be useful for preallocation of arrays.
      Returns: the number of children in the container
  */
  size_t nChildren() nothrow
  {
    size_t _retval;
    _retval = g_variant_iter_n_children(cast(GVariantIter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the next item in the container.  If no more items remain then
      null is returned.
      
      Use [gid.glib2.variant.Variant.unref] to drop your reference on the return value when
      you no longer need it.
      
      Here is an example for iterating with [gid.glib2.variant_iter.VariantIter.nextValue]:
      ```c
        // recursively iterate a container
        void
        iterate_container_recursive (GVariant *container)
        {
          GVariantIter iter;
          GVariant *child;
      
          g_variant_iter_init (&iter, container);
          while ((child = g_variant_iter_next_value (&iter)))
            {
              g_print ("type '%s'\n", g_variant_get_type_string (child));
      
              if (g_variant_is_container (child))
                iterate_container_recursive (child);
      
              g_variant_unref (child);
            }
        }
      ```
      Returns: a #GVariant, or null
  */
  gid.glib2.variant.Variant nextValue() nothrow
  {
    GVariant* _cretval;
    _cretval = g_variant_iter_next_value(cast(GVariantIter*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

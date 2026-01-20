/// Module for [VariantIter] struct
module glib.variant_iter;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import glib.variant;

/**
    #GVariantIter is an opaque data structure and can only be accessed
    using the following functions.
*/
struct VariantIter
{
  /** */
  size_t[16] x;

  /**
      Queries the number of child items in the container that we are
      iterating over.  This is the total number of items -- not the number
      of items remaining.
      
      This function might be useful for preallocation of arrays.
      Returns: the number of children in the container
  */
  size_t nChildren()
  {
    size_t _retval;
    _retval = g_variant_iter_n_children(cast(GVariantIter*)&this);
    return _retval;
  }

  /**
      Gets the next item in the container.  If no more items remain then
      null is returned.
      
      Use [glib.variant.Variant.unref] to drop your reference on the return value when
      you no longer need it.
      
      Here is an example for iterating with [glib.variant_iter.VariantIter.nextValue]:
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
  glib.variant.Variant nextValue()
  {
    GVariant* _cretval;
    _cretval = g_variant_iter_next_value(cast(GVariantIter*)&this);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Module for [VariantBuilder] class
module glib.variant_builder;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import glib.variant;
import glib.variant_type;
import gobject.boxed;

/**
    A utility type for constructing container-type #GVariant instances.
    
    This is an opaque structure and may only be accessed using the
    following functions.
    
    #GVariantBuilder is not threadsafe in any way.  Do not attempt to
    access it from more than one thread.
*/
class VariantBuilder : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_variant_builder_get_type != &gidSymbolNotFound ? g_variant_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VariantBuilder self()
  {
    return this;
  }

  /**
      Allocates and initialises a new #GVariantBuilder.
      
      You should call [glib.variant_builder.VariantBuilder.unref] on the return value when it
      is no longer needed.  The memory will not be automatically freed by
      any other call.
      
      In most cases it is easier to place a #GVariantBuilder directly on
      the stack of the calling function and initialise it with
      [glib.variant_builder.VariantBuilder.init_].
  
      Params:
        type = a container type
      Returns: a #GVariantBuilder
  */
  this(glib.variant_type.VariantType type)
  {
    GVariantBuilder* _cretval;
    _cretval = g_variant_builder_new(type ? cast(const(GVariantType)*)type._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds value to builder.
      
      It is an error to call this function in any way that would create an
      inconsistent value to be constructed.  Some examples of this are
      putting different types of items into an array, putting the wrong
      types or number of items in a tuple, putting more than one value into
      a variant, etc.
      
      If value is a floating reference (see [glib.variant.Variant.refSink]),
      the builder instance takes ownership of value.
  
      Params:
        value = a #GVariant
  */
  void addValue(glib.variant.Variant value)
  {
    g_variant_builder_add_value(cast(GVariantBuilder*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Closes the subcontainer inside the given builder that was opened by
      the most recent call to [glib.variant_builder.VariantBuilder.open].
      
      It is an error to call this function in any way that would create an
      inconsistent value to be constructed (ie: too few values added to the
      subcontainer).
  */
  void close()
  {
    g_variant_builder_close(cast(GVariantBuilder*)this._cPtr);
  }

  /**
      Ends the builder process and returns the constructed value.
      
      It is not permissible to use builder in any way after this call
      except for reference counting operations (in the case of a
      heap-allocated #GVariantBuilder) or by reinitialising it with
      [glib.variant_builder.VariantBuilder.init_] (in the case of stack-allocated). This
      means that for the stack-allocated builders there is no need to
      call [glib.variant_builder.VariantBuilder.clear] after the call to
      [glib.variant_builder.VariantBuilder.end].
      
      It is an error to call this function in any way that would create an
      inconsistent value to be constructed (ie: insufficient number of
      items added to a container with a specific number of children
      required).  It is also an error to call this function if the builder
      was created with an indefinite array or maybe type and no children
      have been added; in this case it is impossible to infer the type of
      the empty array.
      Returns: a new, floating, #GVariant
  */
  glib.variant.Variant end()
  {
    GVariant* _cretval;
    _cretval = g_variant_builder_end(cast(GVariantBuilder*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Opens a subcontainer inside the given builder.  When done adding
      items to the subcontainer, [glib.variant_builder.VariantBuilder.close] must be called. type
      is the type of the container: so to build a tuple of several values, type
      must include the tuple itself.
      
      It is an error to call this function in any way that would cause an
      inconsistent value to be constructed (ie: adding too many values or
      a value of an incorrect type).
      
      Example of building a nested variant:
      ```c
      GVariantBuilder builder;
      guint32 some_number = get_number ();
      g_autoptr (GHashTable) some_dict = get_dict ();
      GHashTableIter iter;
      const gchar *key;
      const GVariant *value;
      g_autoptr (GVariant) output = NULL;
      
      g_variant_builder_init (&builder, G_VARIANT_TYPE ("(ua{sv})"));
      g_variant_builder_add (&builder, "u", some_number);
      g_variant_builder_open (&builder, G_VARIANT_TYPE ("a{sv}"));
      
      g_hash_table_iter_init (&iter, some_dict);
      while (g_hash_table_iter_next (&iter, (gpointer *) &key, (gpointer *) &value))
        {
          g_variant_builder_open (&builder, G_VARIANT_TYPE ("{sv}"));
          g_variant_builder_add (&builder, "s", key);
          g_variant_builder_add (&builder, "v", value);
          g_variant_builder_close (&builder);
        }
      
      g_variant_builder_close (&builder);
      
      output = g_variant_builder_end (&builder);
      ```
  
      Params:
        type = the #GVariantType of the container
  */
  void open(glib.variant_type.VariantType type)
  {
    g_variant_builder_open(cast(GVariantBuilder*)this._cPtr, type ? cast(const(GVariantType)*)type._cPtr(No.Dup) : null);
  }
}

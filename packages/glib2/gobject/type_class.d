/// Module for [TypeClass] struct
module gobject.type_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    An opaque structure used as the base of all classes.
*/
struct TypeClass
{
  /** */
  GType gType;

  /**
      Registers a private structure for an instantiatable type.
      
      When an object is allocated, the private structures for
      the type and all of its parent types are allocated
      sequentially in the same memory block as the public
      structures, and are zero-filled.
      
      Note that the accumulated size of the private structures of
      a type and all its parent types cannot exceed 64 KiB.
      
      This function should be called in the type's class_init() function.
      The private structure can be retrieved using the
      G_TYPE_INSTANCE_GET_PRIVATE() macro.
      
      The following example shows attaching a private structure
      MyObjectPrivate to an object MyObject defined in the standard
      GObject fashion in the type's class_init() function.
      
      Note the use of a structure member "priv" to avoid the overhead
      of repeatedly calling MY_OBJECT_GET_PRIVATE().
      
      ```c
      typedef struct _MyObject        MyObject;
      typedef struct _MyObjectPrivate MyObjectPrivate;
      
      struct _MyObject {
       GObject parent;
      
       MyObjectPrivate *priv;
      };
      
      struct _MyObjectPrivate {
        int some_field;
      };
      
      static void
      my_object_class_init (MyObjectClass *klass)
      {
        g_type_class_add_private (klass, sizeof (MyObjectPrivate));
      }
      
      static void
      my_object_init (MyObject *my_object)
      {
        my_object->priv = G_TYPE_INSTANCE_GET_PRIVATE (my_object,
                                                       MY_TYPE_OBJECT,
                                                       MyObjectPrivate);
        // my_object->priv->some_field will be automatically initialised to 0
      }
      
      static int
      my_object_get_some_field (MyObject *my_object)
      {
        MyObjectPrivate *priv;
      
        g_return_val_if_fail (MY_IS_OBJECT (my_object), 0);
      
        priv = my_object->priv;
      
        return priv->some_field;
      }
      ```
  
      Params:
        privateSize = size of private structure
  
      Deprecated: Use the G_ADD_PRIVATE() macro with the `G_DEFINE_*`
          family of macros to add instance private data to a type
  */
  void addPrivate(size_t privateSize)
  {
    g_type_class_add_private(cast(GTypeClass*)&this, privateSize);
  }

  /** */
  void* getPrivate(gobject.types.GType privateType)
  {
    auto _retval = g_type_class_get_private(cast(GTypeClass*)&this, privateType);
    return _retval;
  }

  /**
      This is a convenience function often needed in class initializers.
      It returns the class structure of the immediate parent type of the
      class passed in.  Since derived classes hold a reference count on
      their parent classes as long as they are instantiated, the returned
      class will always exist.
      
      This function is essentially equivalent to:
      g_type_class_peek (g_type_parent (G_TYPE_FROM_CLASS (g_class)))
      Returns: the parent class
            of g_class
  */
  gobject.type_class.TypeClass peekParent()
  {
    GTypeClass* _cretval;
    _cretval = g_type_class_peek_parent(cast(GTypeClass*)&this);
    gobject.type_class.TypeClass _retval;
    if (_cretval)
      _retval = *cast(gobject.type_class.TypeClass*)_cretval;
    return _retval;
  }

  /**
      This function is essentially the same as [gobject.type_class.TypeClass.ref_],
      except that the classes reference count isn't incremented.
      As a consequence, this function may return null if the class
      of the type passed in does not currently exist (hasn't been
      referenced before).
  
      Params:
        type = type ID of a classed type
      Returns: the #GTypeClass
            structure for the given type ID or null if the class does not
            currently exist
  */
  static gobject.type_class.TypeClass peek(gobject.types.GType type)
  {
    GTypeClass* _cretval;
    _cretval = g_type_class_peek(type);
    gobject.type_class.TypeClass _retval;
    if (_cretval)
      _retval = *cast(gobject.type_class.TypeClass*)_cretval;
    return _retval;
  }

  /**
      A more efficient version of [gobject.type_class.TypeClass.peek] which works only for
      static types.
  
      Params:
        type = type ID of a classed type
      Returns: the #GTypeClass
            structure for the given type ID or null if the class does not
            currently exist or is dynamically loaded
  */
  static gobject.type_class.TypeClass peekStatic(gobject.types.GType type)
  {
    GTypeClass* _cretval;
    _cretval = g_type_class_peek_static(type);
    gobject.type_class.TypeClass _retval;
    if (_cretval)
      _retval = *cast(gobject.type_class.TypeClass*)_cretval;
    return _retval;
  }

  /**
      Increments the reference count of the class structure belonging to
      type. This function will demand-create the class if it doesn't
      exist already.
  
      Params:
        type = type ID of a classed type
      Returns: the #GTypeClass
            structure for the given type ID
  */
  static gobject.type_class.TypeClass ref_(gobject.types.GType type)
  {
    GTypeClass* _cretval;
    _cretval = g_type_class_ref(type);
    gobject.type_class.TypeClass _retval;
    if (_cretval)
      _retval = *cast(gobject.type_class.TypeClass*)_cretval;
    return _retval;
  }
}

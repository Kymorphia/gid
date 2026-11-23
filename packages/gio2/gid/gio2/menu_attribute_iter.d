/// Module for [MenuAttributeIter] class
module gid.gio2.menu_attribute_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    #GMenuAttributeIter is an opaque structure type.  You must access it
    using the functions below.
*/
class MenuAttributeIter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_menu_attribute_iter_get_type != &gidSymbolNotFound ? g_menu_attribute_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMenuAttributeIter";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuAttributeIter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.menu_attribute_iter.MenuAttributeIter]
      Returns: New builder object
  */
  static MenuAttributeIterGidBuilder builder() nothrow
  {
    return new MenuAttributeIterGidBuilder;
  }

  /**
      This function combines [gid.gio2.menu_attribute_iter.MenuAttributeIter.next] with
      [gid.gio2.menu_attribute_iter.MenuAttributeIter.getName] and [gid.gio2.menu_attribute_iter.MenuAttributeIter.getValue].
      
      First the iterator is advanced to the next (possibly first) attribute.
      If that fails, then false is returned and there are no other
      effects.
      
      If successful, name and value are set to the name and value of the
      attribute that has just been advanced to.  At this point,
      [gid.gio2.menu_attribute_iter.MenuAttributeIter.getName] and [gid.gio2.menu_attribute_iter.MenuAttributeIter.getValue] will
      return the same values again.
      
      The value returned in name remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [gid.glib2.variant.Variant.unref] when it is no longer in use.
  
      Params:
        outName = the type of the attribute
        value = the attribute value
      Returns: true on success, or false if there is no additional
            attribute
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNext` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncGetNext(out string outName, out gid.glib2.variant.Variant value)
  {
    auto _klass = cast(GMenuAttributeIterClass*)_vfuncClass;
    if (!_klass.getNext)
      return typeof(return).init;

    bool _retval;
    char* _outName;
    GVariant* _value;
    _retval = cast(bool)_klass.getNext(cast(GMenuAttributeIter*)this._cPtr, &_outName, &_value);
    outName = _outName.fromCString!(No.Free);
    if (_value)
      value = new gid.glib2.variant.Variant(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of the attribute at the current iterator position, as
      a string.
      
      The iterator is not advanced.
      Returns: the name of the attribute
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_menu_attribute_iter_get_name(cast(GMenuAttributeIter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      This function combines [gid.gio2.menu_attribute_iter.MenuAttributeIter.next] with
      [gid.gio2.menu_attribute_iter.MenuAttributeIter.getName] and [gid.gio2.menu_attribute_iter.MenuAttributeIter.getValue].
      
      First the iterator is advanced to the next (possibly first) attribute.
      If that fails, then false is returned and there are no other
      effects.
      
      If successful, name and value are set to the name and value of the
      attribute that has just been advanced to.  At this point,
      [gid.gio2.menu_attribute_iter.MenuAttributeIter.getName] and [gid.gio2.menu_attribute_iter.MenuAttributeIter.getValue] will
      return the same values again.
      
      The value returned in name remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [gid.glib2.variant.Variant.unref] when it is no longer in use.
  
      Params:
        outName = the type of the attribute
        value = the attribute value
      Returns: true on success, or false if there is no additional
            attribute
  */
  bool getNext(out string outName, out gid.glib2.variant.Variant value) nothrow
  {
    bool _retval;
    char* _outName;
    GVariant* _value;
    _retval = cast(bool)g_menu_attribute_iter_get_next(cast(GMenuAttributeIter*)this._cPtr, &_outName, &_value);
    outName = _outName.fromCString!(No.Free);
    if (_value)
      value = new gid.glib2.variant.Variant(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the attribute at the current iterator position.
      
      The iterator is not advanced.
      Returns: the value of the current attribute
  */
  gid.glib2.variant.Variant getValue() nothrow
  {
    GVariant* _cretval;
    _cretval = g_menu_attribute_iter_get_value(cast(GMenuAttributeIter*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Attempts to advance the iterator to the next (possibly first)
      attribute.
      
      true is returned on success, or false if there are no more
      attributes.
      
      You must call this function when you first acquire the iterator
      to advance it to the first attribute (and determine if the first
      attribute exists at all).
      Returns: true on success, or false when there are no more attributes
  */
  bool next() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_menu_attribute_iter_next(cast(GMenuAttributeIter*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MenuAttributeIter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.menu_attribute_iter.MenuAttributeIter), T.stringof ~ " is not derived from gid.gio2.menu_attribute_iter.MenuAttributeIter");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNext", true)[0]) == gid.gio2.menu_attribute_iter.MenuAttributeIter))
      _installVfunc(klass, "get_next");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMenuAttributeIterClass*)klass;

    switch (vfunc)
    {
      case "get_next":
      {
        static extern(C) gboolean _vfuncGetNextTramp(GMenuAttributeIter* iter, const(char*)* outName, GVariant** value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.menu_attribute_iter.MenuAttributeIter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)iter);
          if (!_obj)
          {
            auto _klass = cast(GMenuAttributeIterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iter);
            if (_klass.getNext)
              return (cast(typeof(&_vfuncGetNextTramp))_klass.getNext)(iter, outName, value);
            return typeof(return).init;
          }

          typeof(*outName) _outNameNull;
          if (!outName)
            outName = &_outNameNull;

          typeof(*value) _valueNull;
          if (!value)
            value = &_valueNull;

          bool _dretval;
          string _outName;
          gid.glib2.variant.Variant _value;

          try
          {
            _dretval = _obj.vfuncGetNext(_outName, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_attribute_iter.MenuAttributeIter.vfuncGetNext");
          }
          auto _retval = cast(gboolean)_dretval;
          *cast(char**)outName = _outName.toCString!(No.Malloc, No.Nullable);
          *value = _value ? cast(GVariant*)_value._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getNext = cast(typeof(_klass.getNext))&_vfuncGetNextTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.menu_attribute_iter.MenuAttributeIter]
class MenuAttributeIterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.menu_attribute_iter.MenuAttributeIter]
final class MenuAttributeIterGidBuilder : MenuAttributeIterGidBuilderImpl!MenuAttributeIterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuAttributeIter build() nothrow
  {
    return new MenuAttributeIter(cast(void*)createGObject(MenuAttributeIter._getGType), Yes.Take);
  }
}

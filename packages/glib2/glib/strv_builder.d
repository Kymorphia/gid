/// Module for [StrvBuilder] class
module glib.strv_builder;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    [glib.strv_builder.StrvBuilder] is a helper object to build a null-terminated string arrays.
    
    The following example shows how to build a two element array:
    
    ```c
      g_autoptr(GStrvBuilder) builder = g_strv_builder_new ();
      g_strv_builder_add (builder, "hello");
      g_strv_builder_add (builder, "world");
      g_auto(GStrv) array = g_strv_builder_end (builder);
    ```
*/
class StrvBuilder : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_strv_builder_get_type != &gidSymbolNotFound ? g_strv_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StrvBuilder self()
  {
    return this;
  }

  /**
      Creates a new #GStrvBuilder with a reference count of 1.
      Use [glib.strv_builder.StrvBuilder.unref] on the returned value when no longer needed.
      Returns: the new #GStrvBuilder
  */
  this()
  {
    GStrvBuilder* _cretval;
    _cretval = g_strv_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add a string to the end of the array.
      
      Since 2.68
  
      Params:
        value = a string.
  */
  void add(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    g_strv_builder_add(cast(GStrvBuilder*)this._cPtr, _value);
  }

  /**
      Appends all the strings in the given vector to the builder.
      
      Since 2.70
  
      Params:
        value = the vector of strings to add
  */
  void addv(string[] value)
  {
    char*[] _tmpvalue;
    foreach (s; value)
      _tmpvalue ~= s.toCString(No.Alloc);
    _tmpvalue ~= null;
    const(char*)* _value = _tmpvalue.ptr;
    g_strv_builder_addv(cast(GStrvBuilder*)this._cPtr, _value);
  }

  /**
      Ends the builder process and returns the constructed NULL-terminated string
      array. The returned value should be freed with [glib.global.strfreev] when no longer
      needed.
      Returns: the constructed string array.
        
        Since 2.68
  */
  string[] end()
  {
    char** _cretval;
    _cretval = g_strv_builder_end(cast(GStrvBuilder*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Add a string to the end of the array. After value belongs to the
      #GStrvBuilder and may no longer be modified by the caller.
      
      Since 2.80
  
      Params:
        value = a string.
              Ownership of the string is transferred to the #GStrvBuilder
  */
  void take(string value)
  {
    char* _value = value.toCString(Yes.Alloc);
    g_strv_builder_take(cast(GStrvBuilder*)this._cPtr, _value);
  }
}

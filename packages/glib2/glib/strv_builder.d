/// Module for [StrvBuilder] class
module glib.strv_builder;

public import gid.basictypes;
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
    
      g_assert_true (g_strv_equal (array, (const char *[]) { "hello", "world", NULL }));
    ```
*/
class StrvBuilder : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_strv_builder_get_type != &gidSymbolNotFound ? g_strv_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StrvBuilder self() nothrow
  {
    return this;
  }

  /**
      Creates a new #GStrvBuilder with a reference count of 1.
      Use [glib.strv_builder.StrvBuilder.unref] on the returned value when no longer needed.
      Returns: the new #GStrvBuilder
  */
  this() nothrow
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
  void add(string value) nothrow
  {
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    g_strv_builder_add(cast(GStrvBuilder*)this._cPtr, _value);
  }

  /**
      Appends all the strings in the given vector to the builder.
      
      Since 2.70
  
      Params:
        value = the vector of strings to add
  */
  void addv(string[] value) nothrow
  {
    auto _value_arr = new char*[](value.length + 1);
    auto _value = cast(char**)_value_arr.ptr;
    foreach (i, s; value) _value[i] = s.toCString!(No.Malloc);
    g_strv_builder_addv(cast(GStrvBuilder*)this._cPtr, _value);
  }

  /**
      Ends the builder process and returns the constructed NULL-terminated string
      array. The returned value should be freed with [glib.global.strfreev] when no longer
      needed.
      Returns: the constructed string array.
        
        Since 2.68
  */
  string[] end() nothrow
  {
    char** _cretval;
    _cretval = g_strv_builder_end(cast(GStrvBuilder*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
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
  void take(string value) nothrow
  {
    char* _value = value.toCString!(Yes.Malloc, No.Nullable);
    g_strv_builder_take(cast(GStrvBuilder*)this._cPtr, _value);
  }

  /**
      Decreases the reference count on the string vector builder, and returns
      its contents as a `NULL`-terminated string array.
      
      This function is especially useful for cases where it's not possible
      to use `g_autoptr()`.
      
      ```c
      GStrvBuilder *builder = g_strv_builder_new ();
      g_strv_builder_add (builder, "hello");
      g_strv_builder_add (builder, "world");
      
      GStrv array = g_strv_builder_unref_to_strv (builder);
      
      g_assert_true (g_strv_equal (array, (const char *[]) { "hello", "world", NULL }));
      
      g_strfreev (array);
      ```
      Returns: the constructed string
          array
  */
  string[] unrefToStrv() nothrow
  {
    GStrv _cretval;
    _cretval = g_strv_builder_unref_to_strv(cast(GStrvBuilder*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}

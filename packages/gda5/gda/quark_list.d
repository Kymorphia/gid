/// Module for [QuarkList] class
module gda.quark_list;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.types;
import gobject.boxed;

/** */
class QuarkList : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_quark_list_get_type != &gidSymbolNotFound ? gda_quark_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override QuarkList self()
  {
    return this;
  }

  /**
      Creates a new #GdaQuarkList, which is a set of key->value pairs,
      very similar to GLib's GHashTable, but with the only purpose to
      make easier the parsing and creation of data source connection
      strings.
      Returns: the newly created #GdaQuarkList.
        
        Free-function: gda_quark_list_free
  */
  this()
  {
    GdaQuarkList* _cretval;
    _cretval = gda_quark_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GdaQuarkList given a string.
      
      string must be a semi-colon separated list of "&lt;key&gt;=&lt;value&gt;" strings (for example
      "DB_NAME=notes;USERNAME=alfred"). Each key and value must respect the RFC 1738 recommendations: the
      <constant>&lt;&gt;&quot;#%{}|\^~[]&apos;`;/?:@=&amp;</constant> and space characters are replaced by
      <constant>&quot;%`ab`&quot;</constant> where
      <constant>ab</constant> is the hexadecimal number corresponding to the character (for example the
      "DB_NAME=notes;USERNAME=al%`20fred`" string will specify a username as "al fred"). If this formalism
      is not respected, then some unexpected results may occur.
  
      Params:
        string_ = a string.
      Returns: the newly created #GdaQuarkList.
        
        Free-function: gda_quark_list_free
  */
  static gda.quark_list.QuarkList newFromString(string string_)
  {
    GdaQuarkList* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gda_quark_list_new_from_string(_string_);
    auto _retval = _cretval ? new gda.quark_list.QuarkList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      string must be a semi-colon separated list of "&lt;key&gt;=&lt;value&gt;" strings (for example
      "DB_NAME=notes;USERNAME=alfred"). Each key and value must respect the RFC 1738 recommendations: the
      <constant>&lt;&gt;&quot;#%{}|\^~[]&apos;`;/?:@=&amp;</constant> and space characters are replaced by
      <constant>&quot;%`ab`&quot;</constant> where
      <constant>ab</constant> is the hexadecimal number corresponding to the character (for example the
      "DB_NAME=notes;USERNAME=al%`20fred`" string will specify a username as "al fred"). If this formalism
      is not respected, then some unexpected results may occur.
      
      Adds new key->value pairs from the given string. If cleanup is
      set to true, the previous contents will be discarded before adding
      the new pairs.
  
      Params:
        string_ = a string.
        cleanup = whether to cleanup the previous content or not.
  */
  void addFromString(string string_, bool cleanup)
  {
    const(char)* _string_ = string_.toCString(No.Alloc);
    gda_quark_list_add_from_string(cast(GdaQuarkList*)this._cPtr, _string_, cleanup);
  }

  /**
      Removes all strings in the given #GdaQuarkList.
  */
  void clear()
  {
    gda_quark_list_clear(cast(GdaQuarkList*)this._cPtr);
  }

  /**
      Creates a new #GdaQuarkList from an existing one.
      Returns: a newly allocated #GdaQuarkList with a copy of the data in qlist.
  */
  gda.quark_list.QuarkList copy()
  {
    GdaQuarkList* _cretval;
    _cretval = gda_quark_list_copy(cast(GdaQuarkList*)this._cPtr);
    auto _retval = _cretval ? new gda.quark_list.QuarkList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Searches for the value identified by name in the given #GdaQuarkList. For protected values
      (authentification data), don't forget to call [gda.quark_list.QuarkList.protectValues] when you
      don't need them anymore (when needed again, they will be unmangled again).
  
      Params:
        name = the name of the value to search for.
      Returns: the value associated with the given key if found, or null if not found.
  */
  string find(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gda_quark_list_find(cast(GdaQuarkList*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Calls the given function for each of the key/value pairs in qlist. The function is passed the key and value
      of each pair, and the given user_data parameter. qlist may not be modified while iterating over it.
  
      Params:
        func = the function to call for each key/value pair
  */
  void foreach_(glib.types.HFunc func)
  {
    extern(C) void _funcCallback(void* key, void* value, void* userData)
    {
      auto _dlg = cast(glib.types.HFunc*)userData;

      (*_dlg)(key, value);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gda_quark_list_foreach(cast(GdaQuarkList*)this._cPtr, _funcCB, _func);
  }

  /**
      Call this function to get rid of the clear version of the value associated to
      name.
  */
  void protectValues()
  {
    gda_quark_list_protect_values(cast(GdaQuarkList*)this._cPtr);
  }

  /**
      Removes an entry from the #GdaQuarkList, given its name.
  
      Params:
        name = an entry name.
  */
  void remove(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gda_quark_list_remove(cast(GdaQuarkList*)this._cPtr, _name);
  }
}

/// Module for [FileAttributeMatcher] class
module gio.file_attribute_matcher;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Determines if a string matches a file attribute.
*/
class FileAttributeMatcher : gobject.boxed.Boxed
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
    return cast(void function())g_file_attribute_matcher_get_type != &gidSymbolNotFound ? g_file_attribute_matcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileAttributeMatcher self()
  {
    return this;
  }

  /**
      Creates a new file attribute matcher, which matches attributes
      against a given string. #GFileAttributeMatchers are reference
      counted structures, and are created with a reference count of 1. If
      the number of references falls to 0, the #GFileAttributeMatcher is
      automatically destroyed.
      
      The attributes string should be formatted with specific keys separated
      from namespaces with a double colon. Several "namespace::key" strings may be
      concatenated with a single comma (e.g. "standard::type,standard::is-hidden").
      The wildcard "*" may be used to match all keys and namespaces, or
      "namespace::*" will match all keys in a given namespace.
      
      ## Examples of file attribute matcher strings and results
      
      $(LIST
        * `"*"`: matches all attributes.
        * `"standard::is-hidden"`: matches only the key is-hidden in the
          standard namespace.
        * `"standard::type,unix::*"`: matches the type key in the standard
          namespace and all keys in the unix namespace.
      )
  
      Params:
        attributes = an attribute string to match.
      Returns: a #GFileAttributeMatcher
  */
  this(string attributes)
  {
    GFileAttributeMatcher* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    _cretval = g_file_attribute_matcher_new(_attributes);
    this(_cretval, Yes.Take);
  }

  /**
      Checks if the matcher will match all of the keys in a given namespace.
      This will always return true if a wildcard character is in use (e.g. if
      matcher was created with "standard::*" and ns is "standard", or if matcher was created
      using "*" and namespace is anything.)
      
      TODO: this is awkwardly worded.
  
      Params:
        ns = a string containing a file attribute namespace.
      Returns: true if the matcher matches all of the entries
        in the given ns, false otherwise.
  */
  bool enumerateNamespace(string ns)
  {
    bool _retval;
    const(char)* _ns = ns.toCString(No.Alloc);
    _retval = cast(bool)g_file_attribute_matcher_enumerate_namespace(cast(GFileAttributeMatcher*)this._cPtr, _ns);
    return _retval;
  }

  /**
      Gets the next matched attribute from a #GFileAttributeMatcher.
      Returns: a string containing the next attribute or, null if
        no more attribute exist.
  */
  string enumerateNext()
  {
    const(char)* _cretval;
    _cretval = g_file_attribute_matcher_enumerate_next(cast(GFileAttributeMatcher*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if an attribute will be matched by an attribute matcher. If
      the matcher was created with the "*" matching string, this function
      will always return true.
  
      Params:
        attribute = a file attribute key.
      Returns: true if attribute matches matcher. false otherwise.
  */
  bool matches(string attribute)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _retval = cast(bool)g_file_attribute_matcher_matches(cast(GFileAttributeMatcher*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Checks if an attribute matcher only matches a given attribute. Always
      returns false if "*" was used when creating the matcher.
  
      Params:
        attribute = a file attribute key.
      Returns: true if the matcher only matches attribute. false otherwise.
  */
  bool matchesOnly(string attribute)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _retval = cast(bool)g_file_attribute_matcher_matches_only(cast(GFileAttributeMatcher*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Subtracts all attributes of subtract from matcher and returns
      a matcher that supports those attributes.
      
      Note that currently it is not possible to remove a single
      attribute when the matcher matches the whole namespace - or remove
      a namespace or attribute when the matcher matches everything. This
      is a limitation of the current implementation, but may be fixed
      in the future.
  
      Params:
        subtract = The matcher to subtract
      Returns: A file attribute matcher matching all attributes of
            matcher that are not matched by subtract
  */
  gio.file_attribute_matcher.FileAttributeMatcher subtract(gio.file_attribute_matcher.FileAttributeMatcher subtract = null)
  {
    GFileAttributeMatcher* _cretval;
    _cretval = g_file_attribute_matcher_subtract(cast(GFileAttributeMatcher*)this._cPtr, subtract ? cast(GFileAttributeMatcher*)subtract._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gio.file_attribute_matcher.FileAttributeMatcher(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Prints what the matcher is matching against. The format will be
      equal to the format passed to [gio.file_attribute_matcher.FileAttributeMatcher.new_].
      The output however, might not be identical, as the matcher may
      decide to use a different order or omit needless parts.
      Returns: a string describing the attributes the matcher matches
          against or null if matcher was null.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = g_file_attribute_matcher_to_string(cast(GFileAttributeMatcher*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

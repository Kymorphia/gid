/// Module for [Atom] class
module gid.gdk3.atom;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;

/**
    An opaque type representing a string as an index into a table
    of strings on the X server.
*/
class Atom : OpaqueWrap!(GdkAtom, void, void)
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
      Determines the string corresponding to an atom.
      Returns: a newly-allocated string containing the string
          corresponding to atom. When you are done with the
          return value, you should free it using [gid.glib2.global.gfree].
  */
  string name() nothrow
  {
    char* _cretval;
    _cretval = gdk_atom_name(cast(GdkAtom)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Finds or creates an atom corresponding to a given string.
  
      Params:
        atomName = a string.
        onlyIfExists = if true, GDK is allowed to not create a new atom, but
            just return `GDK_NONE` if the requested atom doesn’t already
            exists. Currently, the flag is ignored, since checking the
            existance of an atom is as expensive as creating it.
      Returns: the atom corresponding to atom_name.
  */
  static gid.gdk3.atom.Atom intern(string atomName, bool onlyIfExists) nothrow
  {
    GdkAtom _cretval;
    const(char)* _atomName = atomName.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_atom_intern(_atomName, onlyIfExists);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds or creates an atom corresponding to a given string.
      
      Note that this function is identical to [gid.gdk3.atom.Atom.intern] except
      that if a new #GdkAtom is created the string itself is used rather
      than a copy. This saves memory, but can only be used if the string
      will always exist. It can be used with statically
      allocated strings in the main program, but not with statically
      allocated memory in dynamically loaded modules, if you expect to
      ever unload the module again (e.g. do not use this function in
      GTK+ theme engines).
  
      Params:
        atomName = a static string
      Returns: the atom corresponding to atom_name
  */
  static gid.gdk3.atom.Atom internStaticString(string atomName) nothrow
  {
    GdkAtom _cretval;
    const(char)* _atomName = atomName.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_atom_intern_static_string(_atomName);
    auto _retval = _cretval ? new gid.gdk3.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }
}

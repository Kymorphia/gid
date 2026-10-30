/// Module for [OptionGroup] class
module glib.option_group;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    A [glib.option_group.OptionGroup] struct defines the options in a single
    group. The struct has only private fields and should not be directly accessed.
    
    All options in a group share the same translation function. Libraries which
    need to parse commandline options are expected to provide a function for
    getting a [glib.option_group.OptionGroup] holding their options, which
    the application can then add to its #GOptionContext.
*/
class OptionGroup : gobject.boxed.Boxed
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
    return cast(void function())g_option_group_get_type != &gidSymbolNotFound ? g_option_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OptionGroup self() nothrow
  {
    return this;
  }

  /** */
  this(string name, string description, string helpDescription) nothrow
  {
    GOptionGroup* _cretval;
    const(char)* _name = name.toCString;
    const(char)* _description = description.toCString;
    const(char)* _helpDescription = helpDescription.toCString;
    _cretval = g_option_group_new(_name, _description, _helpDescription, null, null);
    this(_cretval, Yes.Take);
  }


  /**
      Adds the options specified in entries to group.
  
      Params:
        entries = a null-terminated array of #GOptionEntrys
  */
  void addEntries(glib.types.OptionEntry[] entries) nothrow
  {
    auto _entries = entries.ptr ? cast(const(GOptionEntry)*)(entries ~ GOptionEntry.init).ptr : [GOptionEntry.init].ptr;
    g_option_group_add_entries(cast(GOptionGroup*)this._cPtr, _entries);
  }

  /**
      A convenience function to use gettext() for translating
      user-visible strings.
  
      Params:
        domain = the domain to use
  */
  void setTranslationDomain(string domain) nothrow
  {
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
    g_option_group_set_translation_domain(cast(GOptionGroup*)this._cPtr, _domain);
  }
}

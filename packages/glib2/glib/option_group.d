/// Module for [OptionGroup] class
module glib.option_group;

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
    return cast(void function())g_option_group_get_type != &gidSymbolNotFound ? g_option_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OptionGroup self()
  {
    return this;
  }

  /** */
  this(string name, string description, string helpDescription)
  {
    GOptionGroup* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    const(char)* _helpDescription = helpDescription.toCString(No.Alloc);
    _cretval = g_option_group_new(_name, _description, _helpDescription, null, null);
    this(_cretval, Yes.Take);
  }


  /**
      Adds the options specified in entries to group.
  
      Params:
        entries = a null-terminated array of #GOptionEntrys
  */
  void addEntries(glib.types.OptionEntry[] entries)
  {
    auto _entries = cast(const(GOptionEntry)*)(entries ~ GOptionEntry.init).ptr;
    g_option_group_add_entries(cast(GOptionGroup*)this._cPtr, _entries);
  }

  /**
      Sets the function which is used to translate user-visible strings,
      for `--help` output. Different groups can use different
      #GTranslateFuncs. If func is null, strings are not translated.
      
      If you are using gettext(), you only need to set the translation
      domain, see [glib.option_group.OptionGroup.setTranslationDomain].
  
      Params:
        func = the #GTranslateFunc, or null
  */
  void setTranslateFunc(glib.types.TranslateFunc func = null)
  {
    extern(C) const(char)* _funcCallback(const(char)* str, void* data)
    {
      string _dretval;
      auto _dlg = cast(glib.types.TranslateFunc*)data;
      string _str = str.fromCString(No.Free);

      _dretval = (*_dlg)(_str);
      auto _retval = _dretval.toCString(Yes.Alloc);

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    g_option_group_set_translate_func(cast(GOptionGroup*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      A convenience function to use gettext() for translating
      user-visible strings.
  
      Params:
        domain = the domain to use
  */
  void setTranslationDomain(string domain)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    g_option_group_set_translation_domain(cast(GOptionGroup*)this._cPtr, _domain);
  }
}

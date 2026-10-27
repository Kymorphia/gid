/// Module for [IMContextInfo] class
module gtk.imcontext_info;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Bookkeeping information about a loadable input method.
*/
class IMContextInfo
{
  GtkIMContextInfo _cInstance;

  /**
      Create a `imcontext_info.IMContextInfo` wrap type.
      Params:
        contextId = The unique identification string of the input method.
        contextName = The human-readable name of the input method.
        domain = Translation domain to be used with dgettext()
        domainDirname = Name of locale directory for use with bindtextdomain()
        defaultLocales = A colon-separated list of locales where this input method
            should be the default. The asterisk “*” sets the default for all locales.
  */
  this(string contextId = string.init, string contextName = string.init, string domain = string.init, string domainDirname = string.init, string defaultLocales = string.init) nothrow
  {
    this.contextId = contextId;
    this.contextName = contextName;
    this.domain = domain;
    this.domainDirname = domainDirname;
    this.defaultLocales = defaultLocales;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkIMContextInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `contextId` field.
      Returns: The unique identification string of the input method.
  */
  @property string contextId() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).contextId);
  }

  /**
      Set `contextId` field.
      Params:
        propval = The unique identification string of the input method.
  */
  @property void contextId(string propval) nothrow
  {
    (cast(GtkIMContextInfo*)this._cPtr).contextId = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `contextName` field.
      Returns: The human-readable name of the input method.
  */
  @property string contextName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).contextName);
  }

  /**
      Set `contextName` field.
      Params:
        propval = The human-readable name of the input method.
  */
  @property void contextName(string propval) nothrow
  {
    (cast(GtkIMContextInfo*)this._cPtr).contextName = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `domain` field.
      Returns: Translation domain to be used with dgettext()
  */
  @property string domain() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).domain);
  }

  /**
      Set `domain` field.
      Params:
        propval = Translation domain to be used with dgettext()
  */
  @property void domain(string propval) nothrow
  {
    (cast(GtkIMContextInfo*)this._cPtr).domain = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `domainDirname` field.
      Returns: Name of locale directory for use with bindtextdomain()
  */
  @property string domainDirname() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).domainDirname);
  }

  /**
      Set `domainDirname` field.
      Params:
        propval = Name of locale directory for use with bindtextdomain()
  */
  @property void domainDirname(string propval) nothrow
  {
    (cast(GtkIMContextInfo*)this._cPtr).domainDirname = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `defaultLocales` field.
      Returns: A colon-separated list of locales where this input method
          should be the default. The asterisk “*” sets the default for all locales.
  */
  @property string defaultLocales() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)this._cPtr).defaultLocales);
  }

  /**
      Set `defaultLocales` field.
      Params:
        propval = A colon-separated list of locales where this input method
            should be the default. The asterisk “*” sets the default for all locales.
  */
  @property void defaultLocales(string propval) nothrow
  {
    (cast(GtkIMContextInfo*)this._cPtr).defaultLocales = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
